require 'rails_helper'

RSpec.describe "Indices", type: :request do
    
    let(:ind) { build(:index) }
    
    before do
        ind.save
        # Stub methods in module AlphaVantage
        allow_any_instance_of(Index).to receive(:get_index_price).with(anything()) { returned_get_index_price }
    end

    describe 'GET show' do
        before do
            get "/indices/#{ind.symbol}"
        end
        it "returns response 200: OK" do
            expect(response.status).to eq(200)
        end
        it "returns a json" do
            expect(response.content_type).to eq("application/json; charset=utf-8")
        end
        it "responds with object" do
            expect(JSON.parse(response.body_parts[0])).to include(ind.attributes.slice('id', 'symbol'))
        end
    end
    
    describe 'GET index' do
        before do
            get "/indices"
        end
        it "returns response 200: OK" do
            expect(response.status).to eq(200)
        end
        it "returns a json" do
            expect(response.content_type).to eq("application/json; charset=utf-8")
        end
        it "responds with object" do
            expect(JSON.parse(response.body_parts[0])[0]).to include(ind.attributes.slice('id', 'symbol'))
        end
    end

end
