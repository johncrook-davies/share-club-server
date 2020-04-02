require 'active_support/concern'
module Iex
    require 'net/http'
    extend ActiveSupport::Concern
    
    TOKEN='Tpk_fc7f52f381014180aca34c3beea639b9'
    VERSION='stable'
    MARKET_DATA_API_URL='https://sandbox.iexapis.com'

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
        def get_info_for(props)
            # Gets price and simple stats for investment
            # Inputs:   Hash (:type, :name)
            # Outputs:  Json <price and simple data>
            type = props[:type]
            name = props[:name]
            return send_request("#{MARKET_DATA_API_URL}/#{VERSION}/#{type}/#{name}/quote?token=#{TOKEN}")
        end
    
        def get_historical_for(props)
            # Gets historical data for investment
            # Inputs:   Hash (:type, :name, :interval (Optional), :date (Optional))
            # Outputs:  Json [{<first>, <second>}]
            type = props[:type]
            name = props[:name]
            date = props[:date] ? "date/#{props[:date]}" : false
            interval = props[:interval] ? props[:interval] : false
            qry_str = interval || (date || "date/#{(Date.today-1).strftime('%Y%m%d')}")
            return send_request(
                "#{MARKET_DATA_API_URL}/#{VERSION}/#{type}/#{name}/chart/#{qry_str}?token=#{TOKEN}"
                )
        end
    
        def get_currencies()
            # Gets list of currencies
            # Inputs: Nil
            # Outputs Json {currencies: [<currency>], pairs: [<exchange rate>]}
            return send_request("#{MARKET_DATA_API_URL}/#{VERSION}/ref-data/fx/symbols?token=#{TOKEN}")
        end
    
        def get_stocks(props)
            # Gets list of stocks for a region
            # Inputs: Hash {:region(ISO 3166-1 alpha-2 country code)}
            # Outputs Json [{<stock>},{<stock>}, ...]
            region=props[:region]
            return send_request("#{MARKET_DATA_API_URL}/#{VERSION}/ref-data/region/#{region}/symbols?token=#{TOKEN}")
        end
    
        def get_indices()
            # Gets list of stocks for a region
            # Inputs: Nil
            # Outputs Json {currencies: [<currency>], pairs: [<exchange rate>]}
            return send_request("#{MARKET_DATA_API_URL}/#{VERSION}/ref-data/exchanges?token=#{TOKEN}")
        end
    end
end