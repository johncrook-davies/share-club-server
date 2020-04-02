require 'rails_helper'

RSpec.describe Exchange, type: :model do
    
    let(:ex) { build(:exchange) }
    
    before do
        ex.save
    end
    
    it "creates for valid input" do
        expect(Exchange.find_by(id: ex.id)).to be
    end
    
end
