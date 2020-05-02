class IndicesController < ApplicationController
    
    def show
        # Returns single index
        
        if ind = Index.find_by(symbol: index_params[:id])
            render json: ind
        else
            raise ActionController::RoutingError.new('Not Found')
        end
    end
    
    def index
        # Returns all indices
        
        if inds = Index.all
            render json: inds
        else
            raise ActionController::RoutingError.new('Not Found')
        end
    end
    
    private
        def index_params
            params.permit(:id)
        end
    
end
