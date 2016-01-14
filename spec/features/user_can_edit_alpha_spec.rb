require "rails_helper"

feature "registered user can sort links alphabetically", js: true do

  scenario "user can sort alphabetically" do
    user ||= User.create(email: "bret@isabeast.com",
                         password: "password",
                         password_confirmation: "password")

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    user = User.find_by(email: "bret@isabeast.com")

    expect(current_path).to eq(links_path)


    fill_in "link[title]", with: "CNN"
    fill_in "link[link]", with: "http://www.cnn.com/"
    click_button "Create a new link"

    fill_in "link[title]", with: "ABC"
    fill_in "link[link]", with: "http://abc.go.com/"
    click_button "Create a new link"

    fill_in "link[title]", with: "Zipskee"
    fill_in "link[link]", with: "http://beta.zipskee.com/"
    click_button "Create a new link"

    expect(page).to have_content("CNN")
    expect(page).to have_content("http://www.cnn.com/")

    expect(page).to have_content("ABC")
    expect(page).to have_content("http://abc.go.com/")

    click_button 'Sort Alphabetically'

    within first('.all-links') do
      expect(page).to have_content("ABC")
    end
  end
end