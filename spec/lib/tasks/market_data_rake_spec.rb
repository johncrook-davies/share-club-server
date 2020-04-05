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