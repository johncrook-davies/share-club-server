require 'rails_helper'

RSpec.describe Stock, type: :model do
    
    let(:stock) { build(:stock) }
    
    before do
        stock.save
        # Stub methods in module Iex
        allow(stock).to receive(:get_info_for).with(anything()) { returned_get_info_for }
    end
    
    it "creates for valid input" do
        expect(Stock.find_by(id: stock.id)).to be
    end
    
    it "is accessible via exchange" do
        ex = Exchange.find stock.exchange_id
        expect(ex.stocks).to contain_exactly(stock)
    end
    
    it "has method to update market data" do
        # Returns true
        expect(stock.get_latset_info).to eq(true)
        # Price is updated
        expect(stock.latest_price).to eq(JSON.parse(returned_get_info_for)['latestPrice'])
    end
    
end
