class StocksController < ApplicationController
    
    def show
        # Returns single stock
        
        if stock = Stock.find_by(symbol: stock_params[:id])
            render json: stock
        else
            raise ActionController::RoutingError.new('Not Found')
        end
    end
    
    def index
        # Returns all stocks
        
        if stocks = Stock.all
            render json: stocks
        else
            raise ActionController::RoutingError.new('Not Found')
        end
    end
    
    private
        def stock_params
            params.permit(:id)
        end
end
