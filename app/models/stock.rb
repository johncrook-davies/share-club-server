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
        # Turn json response to hash
        hash = JSON.parse(payload)
        # Defined a mapping between response and Stock
        # attributes
        field_map = {
            'symbol' => :symbol,
            'latestPrice' => :latest_price,
            'companyName' => :name
            }
        # Remove all attributes of response that are
        # not Stock attributes
        filtered_object = hash.select{ | k, v | 
            field_map.keys.include? k
            }
        # Create an empty hashh
        renamed_filtered_object = {}
        # Fill empty hash with response values
        # labelled using mapping
        filtered_object.each do | k, v |
            renamed_filtered_object[field_map[k]] = v
        end
        update(renamed_filtered_object)
        return self
    end
    
    # Class methods
    class << self
        def this_is_a_thing()
            return "This works"
        end
    end
    
    # Private instance methods
    private
        
end
