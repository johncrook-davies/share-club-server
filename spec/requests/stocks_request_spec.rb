require 'rails_helper'

RSpec.describe "Stocks", type: :request do
    
    let(:stock) { build(:stock) }
    
    before do
        stock.save
    end

    describe 'GET show' do
        before do
            get "/stocks/#{stock.symbol}"
        end
        it "returns response 200: OK" do
            expect(response.status).to eq(200)
        end
        it "returns a json" do
            expect(response.content_type).to eq("application/json; charset=utf-8")
        end
        it "responds with object" do
            expect(response.body_parts[0]).to include(stock.to_json)
        end
    end
    
end
