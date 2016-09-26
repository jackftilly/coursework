require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "GET #new" do
    it "renders a new comment template" do
      visit new_comment_url
      expect(page).to have_content('Add Comment')
    end
  end

  describe "POST #create" do
    
  end
end
