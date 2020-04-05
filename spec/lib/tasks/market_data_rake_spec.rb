require File.expand_path("../../../support/shared_contexts/rake.rb", __FILE__)
require "rails_helper"

describe "market_data:index", type: :task do
    include_context "rake"
    
    # Definee the exchange
    let(:ex) { build(:exchange) }
    let(:stock) { build(:stock) }

    before do
        ex.save
        # Stub methods in module Iex
        allow_any_instance_of(Exchange).to receive(:get_stock_list) { stock.save }
        # Invoke action
        subject.invoke(ex.symbol)
    end
    
    it "updates exchange with list of stocks" do
        expect(Stock.find_by(symbol: stock.symbol)).to be
    end
end

describe "market_data:update", type: :task do
    include_context "rake"
    
    # Definee the exchange
    let(:stock) { build(:stock) }

    before do
        stock.save
        # Stub methods in module Iex
        allow(Stock).to receive(:get_latest_info_all) { stock.update(latest_price: 10) }
        # Invoke action
        subject.invoke
    end
    
    it "updates stocks" do
        expect(Stock.find_by(symbol: stock.symbol).latest_price).to eq(10)
    end
end