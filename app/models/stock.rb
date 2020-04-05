class Stock < ApplicationRecord
    include Iex
    belongs_to :exchange
    
    def init
        # Initialisation methods
    end
    
    def get_latset_info()
        # GET request to market data server
        payload = get_info_for(
            type: 'stock', 
            name: symbol
                )
        puts payload
        updated_data = get_only_required_fields(json: payload, mapping: {
            'symbol' => :symbol,
            'latestPrice' => :latest_price,
            'companyName' => :name
            })
        update(updated_data)
        return self
    end
    
    # Class methods
    class << self
        # Class methods here
    end
    
    # Private instance methods
    private
        
end
