require "rails_helper"

feature "guest creates an account" do

  scenario "user can signin" do
    user ||= User.create(email: "bret@isabeast.com",
                          password: "password",
             password_confirmation: "password")

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    user = User.find_by(email: "bret@isnotmodest.com")

    expect(current_path).to eq(links_path)
    within("#user-name") do
      expect(page).to have_content("bret@isabeast.com")
    end
  end
end
