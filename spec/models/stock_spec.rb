require 'rails_helper'

RSpec.describe Stock, type: :model do
    
    let(:stock_one) { build(:stock) }
    let(:stock_two) { build(:stock) }
    let(:stock_with_indices) { create(:stock_with_indices) }
    let(:test_data) {
        JSON.parse(returned_get_info_for) 
    }
    
    before do
        stock_one.save
        stock_two.save
        # Stub methods in module Iex
        allow_any_instance_of(Stock).to receive(:get_info_for).with(anything()) { returned_get_info_for }
        # Stub methods in module AlphaVantage
        allow_any_instance_of(Index).to receive(:get_index_price).with(anything()) { returned_get_index_price }
    end
    
    it "creates for valid input" do
        expect(Stock.find_by(id: stock_one.id)).to be
    end
    
    it "can access indices" do
        expect(
            Stock.find_by(id: stock_with_indices.id).indices.length
        ).to eql(5)
    end
    
    it "has method to update market data" do
        # Returns true
        expect(stock_one.get_latest_info).to eq(true)
        # Price is updated
        expect(stock_one.latest_price).to eq(test_data['latestPrice'])
    end
    
    it "has Class method to update all market data" do
        # Returns all
        expect(Stock.get_latest_info_all).to eq(Stock.all)
        # Price is updated
        expect(Stock.all.pluck(:latest_price)).to eq([test_data['latestPrice'],test_data['latestPrice']])
    end
    
end
