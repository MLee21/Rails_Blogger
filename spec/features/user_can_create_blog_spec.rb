require 'rails_helper'

RSpec.describe "User creates a blog" do
  context "with valid attributes" do
    it "saves and displays the blog content" do
      visit new_article_path
      fill_in "article[title]", with: "This is my first blog"
      fill_in "article[body]", with: "Here is the content."
      click_button "Create Article"
      expect(page).to have_content('This is my first blog')
      expect(page).to have_content('Here is the content')
    end
  end
end