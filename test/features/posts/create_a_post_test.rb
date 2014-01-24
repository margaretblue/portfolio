require "test_helper"

feature "Create A Post" do
  scenario "submit form data to create a new post" do
    #author goes to blank Post form
    visit new_post_path
    #need to sign in
    test_sign_in
    fill_in('Title', :with => posts(:cr).title)
    #fill_in('Body', :with => 'This is how I learned to make Rails apps')
    fill_in('Body', :with => posts(:cr).body)
    #when submit the form
    click_on('Create Post')
    #new post should be shown to author with confirmation msg
    page.text.must_include posts(:cr).title
    page.text.must_include('Post was successfully created')
  end
end
