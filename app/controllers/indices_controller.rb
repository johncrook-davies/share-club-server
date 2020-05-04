class IndicesController < ApplicationController
    
  def show
    # Returns single index

    if ind = Index.find_by(symbol: index_params[:id])
      render json: ind.stocks
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def index
    # Returns all indices

    if inds = Index.all
      result = []
      inds.each do | i |
        result << {index: i, stocks: i.stocks.all}
      end
      render json: result
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private
    def index_params
      params.permit(:id)
    end
    
end
