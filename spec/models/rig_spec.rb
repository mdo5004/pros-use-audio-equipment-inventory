require 'rails_helper'

RSpec.describe Rig, type: :model do
it "is valid with a name and user" do
    user = User.create(name: "My Name", email: "test@test.com", password: "password")
    rig = user.rigs.create(:name => "New Rig")
    expect(rig).to be_valid
end
it "is invalid without a name" do
    user = User.create(name: "My Name", email: "test@test.com", password: "password")
    rig = user.rigs.create
    expect(rig).to_not be_valid
end
it "is invalid without an user" do
    rig =Rig.new(:name => "New Rig")
    expect(rig.valid?).to be false
end

it "has many items" do 
end
it "has an owner" do
end

end
