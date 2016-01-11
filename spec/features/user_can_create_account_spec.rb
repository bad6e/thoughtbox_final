require "rails_helper"

feature "guest creates an account" do
  scenario "guest visits the login page" do
    visit root_path
    click_on "Not registered? Sign up here."
    expect(current_path).to eq(join_path)
  end

  scenario "guest registers an account" do
    visit join_path
    fill_in "user[email]", with: "bret@isnotmodest.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Join Thought Box"

    user = User.find_by(email: "bret@isnotmodest.com")

    expect(current_path).to eq(links_path)
    within("#user-name") do
      expect(page).to have_content("bret@isnotmodest.com")
    end
  end

  scenario "guest cannot register account with duplicate email addresses" do
    visit join_path

    visit join_path
    fill_in "user[email]", with: "bret@isnotmodest.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Join Thought Box"

    click_on "Logout"

    visit join_path
    fill_in "user[email]", with: "bret@isnotmodest.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Join Thought Box"

    expect(page).to have_content("has already been taken")
    expect(current_path).to eq(current_path)
  end


  scenario "guest must have the same password to create an account" do
    visit join_path

    visit join_path
    fill_in "user[email]", with: "bret@isnotmodest.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password1"
    click_on "Join Thought Box"

    expect(page).to have_content("doesn't match Password")
    expect(current_path).to eq(current_path)
  end
end
