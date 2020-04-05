class Exchange < ApplicationRecord
    include Iex
    has_many :stocks
    
    def init
        # Initialisation methods
    end
    
    def get_stocks(props)
        # get_stocks method added to exchange so
        # that method can be stubbed in specs
        super
    end
    
    def get_stock_list
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
        # get the fields needed to create a stock, 
        # market suffic from symbol and create a stock
        ar.each do | stk |
            filtered_stk = get_only_required_fields(json: stk, mapping: {
                'symbol' => :symbol,
                'name' => :name
            })
            filtered_stk[:symbol] = filtered_stk[:symbol].gsub(/-.+/,'')
            model_obj = stocks.create(filtered_stk)
            filtered_ar << model_obj
        end
        return filtered_ar
    end
    
    # Class methods
    class << self
        # Class methods here
    end
    
    # Private instance methods
    private
    
end
