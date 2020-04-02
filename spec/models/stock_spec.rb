require 'rails_helper'

RSpec.describe Stock, type: :model do
    
    let(:stock) { build(:stock) }
    
    before do
        stock.save
    end
    
    it "creates for valid input" do
        expect(Stock.find_by(id: stock.id)).to be
    end
    
    it "is accessible via exchange" do
        ex = Exchange.find stock.exchange_id
        expect(ex.stocks).to contain_exactly(stock)
    end
    
    it "has a custom update method" do
        expect(stock.update).to eq("This works")
    end
    
end
