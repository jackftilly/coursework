require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "POST #create" do
    context "with invalid params" do
      it "renders the new user template" do
        post :create, user: { username: "test", password: "passw" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to goal index page" do
        post :create, user: { username: "test", password: "password"}
        expect(response).to redirect_to(goals_url)
      end
    end

  end

end
