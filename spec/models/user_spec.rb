require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {
    User.create(email: "bret@issexy.com", password: "password", password_confirmation: "password")
  }
  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid without a email" do
    user.email = nil
    expect(user).to be_invalid
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).to be_invalid
  end

  it "is invalid with a matching confirmation password" do
    user.password_confirmation = nil
    expect(user).to be_invalid
  end

  it "is invalid with short password" do
    user.password = "fail"
    expect(user).to be_invalid
  end

  it "is invalid with random string for email" do
    user.email = "asdlkfjalgalwrg"
    expect(user).to be_invalid
  end
end
