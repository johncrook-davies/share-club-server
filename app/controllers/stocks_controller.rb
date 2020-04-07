class StocksController < ApplicationController
    
    def show
        # TEST FUNCTION
        # Streams stock information to the messages
        # channel. Simulates price.
        
        if stock = Stock.find_by(symbol: stock_params[:id])
            puts stock.to_json
            stock_hsh = JSON.parse(stock.to_json)
            loop do 
                price = stock.latest_price || 1
                rand_price = rand(price*0.95..price*1.05)
                stock_hsh['latest_price'] = rand_price
                stock_hsh['updated_at'] = Time.now.to_s
                ActionCable.server.broadcast 'messages',
                    stock: stock_hsh
                sleep 5
            end
        else
            raise ActionController::RoutingError.new('Not Found')
        end
    end
    
    private
        def stock_params
            params.permit(:id)
        end
end
