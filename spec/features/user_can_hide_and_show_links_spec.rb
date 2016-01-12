require "rails_helper"

feature "registered user hide/show read links", js: true do

  scenario "user can show only unread links" do
    user ||= User.create(email: "bret@isabeast.com",
                         password: "password",
                         password_confirmation: "password")

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(links_path)

    fill_in "link[title]", with: "CNN"
    fill_in "link[link]", with: "http://www.cnn.com/"
    click_button "Create a new link"

    expect(page).to have_content("CNN")
    expect(page).to have_content("http://www.cnn.com/")

    click_button "Mark as Read"
    click_button "Show Unread Links"

    expect(page).to_not have_content("CNN")
    expect(page).to_not have_content("http://www.cnn.com/")
  end

  scenario "user can show only read links" do
    user ||= User.create(email: "bret@isabeast.com",
                         password: "password",
                         password_confirmation: "password")

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(links_path)

    fill_in "link[title]", with: "CNN"
    fill_in "link[link]", with: "http://www.cnn.com/"
    click_button "Create a new link"

    expect(page).to have_content("CNN")
    expect(page).to have_content("http://www.cnn.com/")

    click_button "Mark as Read"
    click_button "Show Read Links"

    expect(page).to have_content("CNN")
    expect(page).to have_content("http://www.cnn.com/")
  end

  scenario "user can do both" do
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

    expect(page).to have_content("CNN")
    expect(page).to have_content("http://www.cnn.com/")

    expect(page).to have_content("ABC")
    expect(page).to have_content("http://abc.go.com/")


    within "#link-list" do
      first(:button, "Mark as Read").click
    end

    click_button "Show Unread Links"

    expect(page).to_not have_content("ABC")
    expect(page).to have_content("CNN")
  end

  scenario "user can tag links as read" do
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

    expect(page).to have_content("CNN")
    expect(page).to have_content("http://www.cnn.com/")

    within "#link-list" do
      first(:button, "Mark as Read").click
    end
    page.has_css?('line-through')
    page.has_css?('text-decoration')
  end
end