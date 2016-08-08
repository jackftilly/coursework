require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  describe "GET #index" do

    it "displays all goals" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET #new" do
    it "renders new template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    before do
      allow(controller).to receive(:current_user) { FactoryGirl.create(:user) }
    end
    it "creates a new goal and brings you to the show page" do
      # post :create, user: { username: "test1", password: "password" }
      # user = FactoryGirl.create(:user)
      # user = User.create(username: 'test1', password: 'password')
      # login(user)
      post :create, goal: { body: 'goal body'}
      expect(response).to redirect_to(goal_url(Goal.last))
    end

    it "doesn't creae a goal w/ invalid params" do
      post :create, goal: { body: "" }
      expect(response).to render_template('new')
      expect(flash[:errors]).to be_present
    end
  end

  describe "GET #show" do
    before do
      allow(controller).to receive(:current_user) { FactoryGirl.create(:user) }
    end
    # let(:goal) { Goal.new(body: "goal show", user_id: 1).save! }
    it "shows a goals page" do
      FactoryGirl.create(:goal)

      get :show, id: Goal.last.id
      expect(response).to render_template('show')
    end
  end

end
