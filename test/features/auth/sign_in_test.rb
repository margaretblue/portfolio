require "test_helper"

feature "As a site visitor I want to be able to sign out so that I can destroy my session" do
  scenario "sign out" do
    #SIGN IN an existing user (from a fixture)
    visit root_path
    test_sign_in
    page.must_have_content "Signed in successfully."
    page.wont_have_content "Goobye All!"
    #save_and_open_page
  end
  scenario "sign in with twitter works" do
     visit root_path
     click_on "Sign In"
     OmniAuth.config.test_mode = true
     Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
     Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
     OmniAuth.config.add_mock(:twitter,
                              {
                              uid: '12345',
                              info: { nickname: 'test_twitter_user'},
                              })
     click_on "Sign in with Twitter"
     page.must_have_content "test_twitter_user, you are signed in!"
    end
  # with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
end
