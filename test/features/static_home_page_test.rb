require "test_helper"

feature "StaticHomePage" do
  scenario "the test is sound" do
    visit root_path
    page.wont_have_content "Goobye All!"
  end
end
