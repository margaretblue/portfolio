require "test_helper"

feature "Create A Post" do
  scenario "submit form data to create a new post" do
    #author goes to blank Post form
    visit new_post_path
    #form is filled in with attribs Post(title, body)
    fill_in('Title', :with => 'Code Rails')
    fill_in('Body', :with => 'This is how I learned to make Rails apps')
    #when submit the form
    click_on('Create Post')
    #new post should be shown to author with confirmation msg
    page.text.must_include('how I learned to make Rails apps')
    page.text.must_include('Post was successfully created')
  end
end
