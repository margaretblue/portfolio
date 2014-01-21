require "test_helper"

feature "Projects::DeleteAProject" do
  scenario "As the site owner, I want to delete a portfolio item" do
    #GIVEN a listing of existing projects at /projects
    visit projects_path
    page.must_have_content "Artistic"
    #WHEN I delete a project
    page.find("a[href='#{project_path(projects(:freelance))}'][data-method='delete']").click
    page.wont_have_content "Artistic"
    #THEN it no longer appears on the page
  end
end
