require 'rails_helper'

describe UserDetail do
  # describe '#create' do
    it "is invalid without a firstname, lastname, place, postalcode" do
      user_detail = UserDetail.new(
        firstname: "Rina",
        lastname: "Nada",
        place: "toyama",
        postalcode: "0000000")
      expect(user_detail).to be_valid
    end
end
