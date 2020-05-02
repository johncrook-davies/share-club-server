require 'rails_helper'

RSpec.describe Index, type: :model do

    let(:ind) { create(:index_with_stocks) }
    
    before do
        # Stub methods in module AlphaVantage
        allow_any_instance_of(Index).to receive(:get_index_price).with(anything()) { returned_get_index_price }
    end
    
    it "creates for valid input" do
        expect(Index.find_by(id: ind.id)).to be
    end
    
    it "can return constituent stocks" do
        expect(
            Index.find_by(id: ind.id).stocks.length
        ).to eql(5)
    end
    
end
