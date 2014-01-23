require "test_helper"

feature "As a site visitor I want to be able to sign out so that I can destroy my session" do
  scenario "sign out" do
    #SIGN IN an existing user (from a fixture)
    visit root_path
    click_on "Sign In"
    #fill_in "Email", with: "test@example.com"
    fill_in "Email", with: users(:test1).email
    fill_in "Password", with: "password"
    click_on "Sign in"
    page.must_have_content "Signed in successfully."
    page.wont_have_content "Goobye All!"
    #save_and_open_page
  end
end
