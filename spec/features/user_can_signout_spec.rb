require "rails_helper"

feature "guest creates an account" do

  scenario "guest cannot register account with duplicate email addresses" do
    visit join_path

    visit join_path
    fill_in "user[email]", with: "bret@isnotmodest.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Join Thought Box"

    click_on "Logout"
    expect(current_path).to eq(root_path)
  end
end
