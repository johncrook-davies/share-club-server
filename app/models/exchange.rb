class Exchange < ApplicationRecord
    include Iex
    has_many :indices, dependent: :destroy
    has_many :stocks, through: :indices, dependent: :destroy
    
    def init
        # Initialisation methods
    end
    
    def get_stock_list(props = {limit: false})
        # Requests list of stocks that are members
        # of exchange from market data server and
        # creates relevant stocks
        
        # GET request to market data server
        payload = get_stocks(
            exchange: symbol
                )
        # Turn json response into an array of hashes
        ar = JSON.parse(payload)
        # Declare empty array
        filtered_ar = []
        # For each stock in returned market data get
        # get the fields needed to create a stock and
        # create a stock
        ar.each do | stk |
            filtered_stk = get_only_required_fields(json: stk, mapping: {
                'symbol' => :symbol,
                'name' => :name
            })
            # Uncomment to remove market suffix
            #filtered_stk[:symbol] = filtered_stk[:symbol].gsub(/-.+/,'')
            filtered_ar << filtered_stk
        end
        if props[:limit] 
            number_to_delete = filtered_ar.length - props[:limit].to_i
            number_to_delete.times do
                filtered_ar.delete_at(rand(filtered_ar.length))
            end
        end
        # Create new, update existing and delete old
        exist_stks = stocks.all || []
        exist_stk_symbols = exist_stks.pluck(:symbol)
        filtered_ar.each do | stk |
            if exist_stk_symbols.include? stk[:symbol]
                # Replace existing stocks
                stocks.find_by(symbol: stk[:symbol]).update(stk)
            else
                # Create new stocks
                ## If unknown index does not exist then create it
                old_logger = ActiveRecord::Base.logger
                ActiveRecord::Base.logger = nil
                unless index = indices.find_by(name: 'Unknown')
                    index = indices.create(name: 'Unknown', symbol: 'UNK')
                end
                ActiveRecord::Base.logger = old_logger
                stk[:exchange] = self
                index.stocks.create(stk)
            end
        end
        # Remove old stocks
        exist_stk_symbols.each do | exist_symbol |
            if !(filtered_ar.any? {| stk | stk[:symbol] == exist_symbol})
                stocks.find_by(symbol: exist_symbol).destroy
            end
        end
        #filtered_ar = Stock.create(filtered_ar)
        return filtered_ar
    end
    
    # Class methods
    class << self
        # Class methods here
    end
    
    # Private instance methods
    private
    
end
