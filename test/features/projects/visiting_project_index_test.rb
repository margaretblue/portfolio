require "test_helper"

feature "Project::VisitingProjectIndex" do
  scenario "As the site visitor, I want to visit the site and see a list of projects" do
    #GIVEN a few projects (loaded from fixtures)
    #WHEN I visit /projects
    visit projects_path
    #THEN
    page.must_have_content "Project"
    page.must_have_content "Ruby Site"
    page.must_have_content "Scissors"
  end
end
