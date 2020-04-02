class Stock < ApplicationRecord
    include Iex
    belongs_to :exchange
    
    def init
        # Initialisation methods
    end
    
    def update()
        payload = get_info_for(
            type: 'stock', 
            name: symbol
                )
        return payload
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
