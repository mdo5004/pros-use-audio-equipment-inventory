require 'rails_helper'

RSpec.describe Item, type: :model do
  it "is valid with a name and a manufacturer" do
     item = Item.create(:name => "Test name", :manufacturer => "Sennheiser")
      expect(item).to be_valid
  end
end
