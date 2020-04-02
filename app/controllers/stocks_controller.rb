class StocksController < ApplicationController
    
    def show
        if stock = Stock.find_by(symbol: stock_params[:id])
            render json: stock
        else
            raise ActionController::RoutingError.new('Not Found')
        end
    end
    
    private
        def stock_params
            params.permit(:id)
#            params.require(:stock).permit(
#                :symbol,
#                :name,
#                :latest_price,
#                :exchange_suffix
#            )
        end
end
