require "test_helper"

feature "Projects::ShowAProject" do
  scenario "the test is sound" do
    visit project_path(projects(:freelance))

    page.must_have_content "Something Artistic"
    page.must_have_content "Scissors"
  end
end
