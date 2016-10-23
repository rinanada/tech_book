require 'rails_helper'
describe User do
  describe '#normal_session' do
    context "with valid attributes" do
      it "is invalid without an email, password" do
        user = User.new(
          email: "swe@a.com",
          password: "aaaaaaaa")
        expect(user).to be_valid
      end
    end

    context "without invalid attributes" do
    end

    it "invalid with duplicate email address" do
      # expect(another_user.errors[:email]).to include("has already taken")
    end

    it "is invalid with password that has less than 7 characters" do
    end
  end

  describe '#twitter_session' do
  end

  describe '#facebook_session' do
  end
end
