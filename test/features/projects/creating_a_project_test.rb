require "test_helper"

feature "Projects::CreatingAProject" do
  scenario "creating a new project is sound" do
    #GIVEN a new project page
    visit projects_path
    #WHEN client clicks on "New Project" and fills in form and submits
    click_on "New Project"
    fill_in "Name", with: "Web Developer Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Foundation, HTML, CSS"
    click_on "Create Project"
    #THEN
    page.must_have_content "Project has been created"
    page.text.must_include "Rails"
  end
end
