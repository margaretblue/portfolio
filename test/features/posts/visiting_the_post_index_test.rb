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
end
