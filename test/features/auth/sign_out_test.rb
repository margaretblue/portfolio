require "test_helper"

feature "As a site visitor I want to be able to sign out so that I can destroy my session" do
  scenario "sign out" do
    #SIGN IN an existing user (from a fixture)
    visit root_path
    test_sign_in
    #SIGN OUT that user
    click_on "Sign Out"
    #Check that they are signed out and session is destroyed
    #use launchy to find
    page.must_have_content "Signed out successfully"
    page.wont_have_content "Goobye All!"
    #save_and_open_page
  end
end
