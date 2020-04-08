class Stock < ApplicationRecord
    include Iex
    belongs_to :exchange
    after_commit :broadcast
    
    def init
        # Initialisation methods
    end
    
    def get_latest_info()
        # GET request to market data server
        payload = get_info_for(
            type: 'stock', 
            name: symbol
                )
        updated_data = get_only_required_fields(json: payload, mapping: {
            'symbol' => :symbol,
            'latestPrice' => :latest_price,
            'companyName' => :name
            })
        return update(updated_data)
    end
    
    # Class methods
    class << self
        # Class methods here
        def get_latest_info_all()
            all.each do | s |
                s.get_latest_info
            end
            return all
        end
    end
    
    # Private instance methods
    private
        def broadcast
            ActionCable.server.broadcast "stocks:#{self.symbol}", stock: self
        end
        
end
