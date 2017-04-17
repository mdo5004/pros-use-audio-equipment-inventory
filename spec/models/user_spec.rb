require 'rails_helper'

RSpec.describe User, type: :model do
    it "is vaild with a name, an email address and password" do
        user = User.create(name: "My Name", email: "test@test.com", password: "password")
        expect(user).to be_valid
    end
    it "it invalid without an email address" do
        user = User.create(name: "My Name", password: "password")
        expect(user).to_not be_valid
    end
end
