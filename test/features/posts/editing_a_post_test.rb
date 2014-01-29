require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do
    visit root_path
    test_sign_in
    visit post_path(posts(:cr))
    click_on('Edit')
    fill_in('Title', :with => 'Becoming a Web Developer')
    click_on('Update Post')
    #newly updated post should be shown
    page.must_have_content "Post was successfully updated"
    #confirmation should be shown
    page.must_have_content "Web Developer"
  end
  scenario "author can submit updates to an existing post" do
    visit root_path
    test_sign_in(:author)
    visit post_path(posts(:cr))
    click_on('Edit')
    fill_in('Title', :with => 'Becoming a Web Developer')
    click_on('Update Post')
    #newly updated post should be shown
    page.must_have_content "Post was successfully updated"
    #confirmation should be shown
    page.must_have_content "Web Developer"
  end
  scenario "editor can submit updates to any existing post" do
    visit root_path
    test_sign_in(:editor)
    visit post_path(posts(:cr))
    click_on('Edit')
    fill_in('Title', :with => 'Becoming a Web Developer')
    click_on('Update Post')
    #newly updated post should be shown
    page.must_have_content "Post was successfully updated"
    #confirmation should be shown
    page.must_have_content "Web Developer"
  end

end
