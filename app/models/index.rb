require 'updater'
class Index < ApplicationRecord
    include AlphaVantage
    belongs_to :exchange
    has_and_belongs_to_many :stocks
    after_find :get_latest_info
    
    def init
        # Initialisation methods
    end
    
    def get_latest_info()
        # GET request to market data server
        begin
            payload = get_index_price(name: '^'+symbol, mapping: mapping)
            return update(payload)
        rescue
            return self
        end
    end
    
    private
        def mapping
            return {
                '05. price' => :latest_price
            }
        end
    
end
