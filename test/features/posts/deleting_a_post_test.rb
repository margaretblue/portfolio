require "test_helper"

feature "DeletingAPost" do
  scenario "post is deleted with a click" do
    visit root_path
    test_sign_in
    #post author goes to Post Index Page
    visit posts_path
    #post author clicks on delete link
    page.find("tbody tr:last").click_on "Destroy"
    #post is deleted and doesn't show up
    page.wont_have_content "Software Engineer"
  end
end
