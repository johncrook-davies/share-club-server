require 'rails_helper'

RSpec.describe Exchange, type: :model do
    
    # Definee the exchange
    let(:ex) { create(:exchange_with_indices_with_stocks) }
    before do
        # Stub methods in module Iex
        allow(ex).to receive(:get_stocks).with(anything()) { returned_get_stocks }
    end
    
    it "creates for valid input" do
        expect(Exchange.find_by(id: ex.id)).to be
    end
    
    it "populates stocks when calling get_stock_list" do
        pending
        actual_number_returned = ex.get_stock_list.length
        exp_number_returned = JSON.parse(returned_get_stocks).length
        expect(exp_number_returned).to eq(actual_number_returned)
    end
    
    it "populates only limited stocks when calling get_stock_list with a limit" do
        pending
        actual_number_returned = ex.get_stock_list(limit: 5).length
        exp_number_returned = 5
        expect(exp_number_returned).to eq(actual_number_returned)
    end
    
    it "can return constituent indices" do
        expect(
            Exchange.find_by(id: ex.id).indices.length
        ).to eql(5)
    end
    
    it "can return constituent stocks" do
        expect(
            Exchange.find_by(id: ex.id).stocks.length
        ).to eql(5*5)
    end
    
end
