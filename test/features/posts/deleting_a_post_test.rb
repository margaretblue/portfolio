require "test_helper"

feature "DeletingAPost" do
  scenario "post is deleted with a click" do
    #create a post to test
    # don't need Post.create anymore now have FIXTURES
    #Post.create(title: "Becoming a Software Engineer",
    #            body: "Means striving for excellence")
    #post author goes to Post Index Page
    visit posts_path
    test_sign_in
    #post author clicks on delete link
    page.find("tbody tr:last").click_on "Destroy"
    #post is deleted and doesn't show up
    page.wont_have_content "Software Engineer"
  end
end
