require 'rails_helper'

RSpec.describe "Exchanges", type: :request do
    
    let(:exchange) { build(:exchange) }
    
    before do
        exchange.save
    end

    describe 'GET show' do
        before do
            get "/exchanges/#{exchange.symbol}"
        end
        it "returns response 200: OK" do
            expect(response.status).to eq(200)
        end
        it "returns a json" do
            expect(response.content_type).to eq("application/json; charset=utf-8")
        end
        it "responds with object" do
            expect(response.body_parts[0]).to include(exchange.to_json)
        end
    end
    
    describe 'GET index' do
        before do
            get "/exchanges"
        end
        it "returns response 200: OK" do
            expect(response.status).to eq(200)
        end
        it "returns a json" do
            expect(response.content_type).to eq("application/json; charset=utf-8")
        end
        it "responds with object" do
            expect(response.body_parts[0]).to include(exchange.to_json)
        end
    end

end
