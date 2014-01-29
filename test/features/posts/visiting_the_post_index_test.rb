require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts, show list" do
    #a post will be created
    Post.create(title: "Becoming a Software Engineer",
      body: "Means striving for excellence")
    #visit the post listing at /posts/
    visit posts_path
    #posts created should be visible
    page.text.must_include "Becoming a Software Engineer"
  end
  scenario "show signed in user post I want to only see my own posts" do
    visit root_path
    test_sign_in(:author)
    visit posts_path
    click_on "View My Posts"
    page.text.must_include posts(:cr).title
    page.text.wont_include posts(:http).title
  end

  scenario "editors should see all posts" do
    visit root_path
    test_sign_in(:editor)
    visit posts_path
    page.text.must_include posts(:cr).title
    page.text.must_include posts(:http).title
  end

end
