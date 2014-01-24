require "test_helper"

feature "As a site visitor I want to be able to sign up for an account so that I" do
  scenario "sign up" do
    #GIVEN a registration from visit "/"
    visit root_path
    click_on "Sign Up"
    #WHEN I register with valid info
    fill_in "Email", with: "someone@something.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    #THEN I should be signed up
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "There was a problem with your sign up"

  end
end
