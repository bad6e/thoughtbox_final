require "rails_helper"

feature "registered user can add links" do

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

    fill_in "link[title]", with: "CNN"
    fill_in "link[link]", with: "http://www.cnn.com/"
    click_button "Create a new link"

    expect(page).to have_content("CNN")
    expect(page).to have_content("http://www.cnn.com/")
  end
end