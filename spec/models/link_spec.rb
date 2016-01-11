require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:user) {
    User.create(email: "bret@iscool.com", password: "password", password_confirmation: "password")
  }

  let(:link) {
    Link.create(title: "Google", link: 'http://www.cnn.com/', user_id: user.id)
  }

  it "is valid" do
    expect(link).to be_valid
  end

  it "is invalid without a title" do
    link.title = nil
    expect(link).to be_invalid
  end

  it "is invalid a without a link" do
    link.link = nil
    expect(link).to be_invalid
  end

  it "is invalid with a bad link" do
    link.link = 'AbC'
    expect(link).to be_invalid
  end
end
