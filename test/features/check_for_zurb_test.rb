require "test_helper"

feature "CheckForZurb" do
  scenario "the test is sound" do
    #GIVEN a page, WHEN the user visits
    visit root_path
    #THEN must have Zurb Foundation loaded
    assert page.has_css? '.columns'
    # save_and_open_page
  end
end
