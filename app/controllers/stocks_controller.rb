class StocksController < ApplicationController
    
    def show
        # Finds stock from symbol and renders
        # as a json
        
        if stock = Stock.find_by(symbol: stock_params[:id])
            render json: stock
        else
            raise ActionController::RoutingError.new('Not Found')
        end
    end
    
    private
        def stock_params
            params.permit(:id)
        end
end
