require 'test_helper'

describe  "Portfolio Home Page" do
  it "has Margarets name" do
    visit root_path
    page.should have_content('Margaret')
  end
end
