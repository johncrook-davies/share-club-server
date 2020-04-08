class StocksChannel < ApplicationCable::Channel 
    
    def subscribed
        stock = Stock.find_by(symbol: params[:id])
        stream_for stock.symbol
    end
    
    def unsubscribed
        stop_all_streams
    end
    
end 