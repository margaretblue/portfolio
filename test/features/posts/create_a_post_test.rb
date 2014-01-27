require "test_helper"

feature "Create A Post" do
  scenario "submit form data to create a new post" do
    #author goes to blank Post form
    visit root_path
    test_sign_in(:author)
    visit new_post_path
    fill_in('Title', :with => posts(:cr).title)
    #fill_in('Body', :with => 'This is how I learned to make Rails apps')
    fill_in('Body', :with => posts(:cr).body)
    #when submit the form
    click_on('Create Post')
    #new post should be shown to author with confirmation msg
    page.text.must_include posts(:cr).title
    page.text.must_include('Post was successfully created')
    page.has_css? "#author"
    page.text.must_include users(:author).email #Use your fixture name here
    page.must_have_content "Status: Unpublished"
  end
  scenario "unauthenticated site visitors cannot visit new_post_path" do
    #When I visit the blog index page
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end
  scenario "unauthenticated site vistiors cannot see new post button" do
    #When I visit the blog index page
    visit posts_path
    # I should not see the "New Post" link
    page.wont_have_link "New Post"
  end
  scenario "authors cannot publish" do
    #GIVEN an author's account
    visit root_path
    test_sign_in(:author)

    #When I visit the new page
    visit new_post_path

    #There is no checkbox for published
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    #Given an editor's account
    visit root_path
    test_sign_in(:editor)

    #When I visit the new post page
    visit new_post_path

    #There is a checkbox for published
    page.must_have_field('Published')

    #When I submit the form
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"

    #Then the published post should be shown
    page.text.must_include "Status: Published"
  end

end
