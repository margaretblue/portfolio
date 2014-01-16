require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do
    #given an existing post
    post = Post.create(title: "Becoming a Software Engineer",
      body: "Means striving for excellence.")
    #post author goes to  existing Post detail #show
    visit post_path(post)
    #author clicks on "Edit"
    click_on('Edit')
    #form is filled with changed attribs
    fill_in('Title', :with => 'Becoming a Web Developer')
    click_on('Update Post')
    #newly updated post should be shown
    page.must_have_content "Post was successfully updated"
    #confirmation should be shown
    page.must_have_content "Web Developer"
  end
end
