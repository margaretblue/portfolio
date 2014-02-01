require "test_helper"

feature "Create A Comment" do
  scenario "Site visitors not logged into twitter/omniauth/linkedin" do
    visit post_path(posts(:cr))
    fill_in('Content', :with => comments(:comment1).content)
    fill_in('Author', :with => comments(:comment1).author)
    click_on 'Submit Comment'
    page.text.must_include('Comment was successfully created')
  end

  scenario "Comments not displayed until approved by an author or editor" do
    visit post_path(posts(:cr))
    fill_in('Content', :with => comments(:comment1).content)
    fill_in('Author', :with => comments(:comment1).author)
    click_on 'Submit Comment'
    page.text.must_include('Comment was successfully created')
  end
end
