require "rails_helper"

feature "registered user can edit links", js: true do

  scenario "user can edit links" do
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

    click_on "Edit"

    fill_in "link[title]", with: "ABC"
    fill_in "link[link]", with: "http://abc.go.com/"

    click_on "Submit"

    expect(page).to have_content("ABC")
    expect(page).to have_content("http://abc.go.com/")
  end

  scenario "user can't edit links with no title" do
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

    click_on "Edit"

    fill_in "link[title]", with: ""
    fill_in "link[link]", with: "http://abc.go.com/"

    click_on "Submit"

    expect(page).to have_content("can't be blank")
  end

  scenario "user can't edit links with invalid url" do
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

    click_on "Edit"

    fill_in "link[title]", with: "ABC"
    fill_in "link[link]", with: "hi"

    click_on "Submit"

    expect(page).to have_content("is not a valid URL")
  end

end