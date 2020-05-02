require 'rails_helper'

RSpec.describe Index, type: :model do

    let(:ind) { create(:index_with_stocks) }
    
    it "creates for valid input" do
        expect(Index.find_by(id: ind.id)).to be
    end
    
    it "can return constituent stocks" do
        expect(
            Index.find_by(id: ind.id).stocks.length
        ).to eql(5)
    end
    
end
