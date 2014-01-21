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

  scenario "new project has invalid data" do
    #Given invalid project data entered into form
      visit new_project_path
      fill_in "Name", with: "Q"
    #When the form is submitted with short name and no technologies_used
      click_on "Create Project"
    #THEN the form should be displayed again with error message
      current_path.must_match /projects$/
      page.text.must_include "Project could not be saved"
      page.text.must_include "Name is too short"
      page.text.must_include "Technologies used can't be blank"
  end
end
