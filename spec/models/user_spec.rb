require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "validation tests" do
    #ensures there is an email address is present
    it "ensures an email address is present" do
      user = User.new(password: "qwerty")
      expect(user.valid?).to eq(false)
    end

    #ensures a password is present
    it "ensures a password is present" do
      user = User.new(email: "user@test.com")
      expect(user.valid?).to eq(false)
    end

    #ensures with email address and password, we're good
    it "ensures both email address and password are present" do
      user = User.new(email: "user@test.com", password: "qwerty")
      expect(user.valid?).to eq(true)
    end
  end
end
