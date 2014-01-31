require "test_helper"

feature "DeletingAPost" do
  scenario "editor can delete post with a click" do
    visit root_path
    #note default sign-in user if not speficied is editor
    test_sign_in
    #post author goes to Post Index Page
    visit posts_path
    #post author clicks on delete link
    page.find("tbody tr:last").click_on "Destroy"
    #post is deleted and doesn't show up
    page.wont_have_content "Software Engineer"
  end
  scenario "random unauthenticated site visitor cannot delete post" do
    visit posts_path
    page.wont_have_content "Destroy"
  end
end
