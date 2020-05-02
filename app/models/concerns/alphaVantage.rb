require 'active_support/concern'
module AlphaVantage
    require 'net/http'
    extend ActiveSupport::Concern
    
    TOKEN=(ENV['API_ENV'] != 'production') ? ENV['API_AV_TOKEN'] : ENV['API_AV_TOKEN']
    MARKET_DATA_API_URL=(ENV['API_ENV'] != 'production') ? ENV['API_AV_URL'] : ENV['API_AV_URL']
    
    def send_request(url)
        # Send a request 
        # Inputs: String url of request
        # Outputs:  Body of response
        uri = URI(url)
        Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            request = Net::HTTP::Get.new uri
            response = http.request request # Net::HTTPResponse object
            return response.body
        end
    end
    
    included do
        
        def get_only_required_fields(props)
            # For a given json and field mapping, returns
            # a hash containing only the required fields
            payload = props[:json]
            field_map = props[:mapping]
            # Turn json response to hash if it is
            begin
                hash = JSON.parse(payload)
            rescue
                hash = payload
            end
            # Remove all attributes of response that are
            # not Stock attributes
            filtered_object = hash.select{ | k, v | 
                field_map.keys.include? k
                }
            # Create an empty hash
            renamed_filtered_object = {}
            # Fill empty hash with response values
            # labelled using mapping
            filtered_object.each do | k, v |
                renamed_filtered_object[field_map[k]] = v
            end
            return renamed_filtered_object
        end
        
        def get_index_price(props)
            # Gets price and simple stats for investment
            # Inputs:   
            #   Hash (:name)
            #   Hash mapping between api return and model
            #   object columns
            # Outputs:  Json <price and simple data>
            name = props[:name]
            mapping = props[:mapping]
            payload_json = send_request(
                "#{MARKET_DATA_API_URL}/query?function=GLOBAL_QUOTE&symbol=#{name}&apikey=#{TOKEN}"
                )
            payload = JSON.parse(payload_json)["Global Quote"]
            return get_only_required_fields(
                json: payload, 
                mapping: mapping
            )
        end
    end
end
        