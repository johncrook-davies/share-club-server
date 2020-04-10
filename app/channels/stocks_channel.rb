class StocksChannel < ApplicationCable::Channel 
    
    def subscribed
        @stock = Stock.find_by(symbol: params[:id])
        @stock.start_updating
        stream_for @stock.symbol
    end
    
    def unsubscribed
        @stock.stop_updating
        stop_all_streams
    end
    
end 