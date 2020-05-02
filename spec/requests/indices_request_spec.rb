require 'rails_helper'

RSpec.describe "Indices", type: :request do
    
    let(:ind) { build(:index) }
    
    before do
        ind.save
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
            expect(response.body_parts[0]).to include(ind.to_json)
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
            expect(response.body_parts[0]).to include(ind.to_json)
        end
    end

end
