require 'rails_helper'


RSpec.describe "User deletes a tag" do
  context "delete" do
    it "deletes the tag" do
      article = Article.create(title: "Title1", body: "Body1")
      article.tags << Tag.create(name: "tag1") 
      visit tags_path
      expect(page).to have_content('tag1')
      click_button "Delete"
      expect(page).to_not have_content('tag1')
    end
  end
end