class ExchangesController < ApplicationController
    
    def show
        # Returns single exchange
        
        if ex = Exchange.find_by(symbol: exchange_params[:id])
            render json: ex
        else
            raise ActionController::RoutingError.new('Not Found')
        end
    end
    
    def index
        # Returns all exchanges
        
        if exs = Exchange.all
            render json: exs
        else
            raise ActionController::RoutingError.new('Not Found')
        end
    end
    
    private
        def exchange_params
            params.permit(:id)
        end
    
end
