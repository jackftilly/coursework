require 'spec_helper'
require 'rails_helper'

feature 'Goal index' do
  scenario 'shows all the goals' do
    visit goals_url
    expect(page).to have_content("All Goals!")
  end

  scenario 'all goals should be public' do
    visit goals_url
    FactoryGirl.create(:goal, body:'private', private: true)
    FactoryGirl.create(:goal, body: 'public goal')
    expect(page).to_not have_content('private')
  end

end

feature 'show page' do
  priv_goal = FactoryGirl.create(:goal, body:'private', private: true)
  pub_goal = FactoryGirl.create(:goal)
  scenario "accessibl thorugh goals index" do
    visit goals_url
    goal = Goal.last.body
    click_link goal
    expect(page).to have_content(goal)
    expect(page).to have_content(pub_goal.user.username)
  end
end

feature 'create new link' do
  let!(:user) { FactoryGirl.create(:user) }
  before(:each) do
    visit new_session_url
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_on 'Login!'
  end


  scenario 'accesible through goals index' do
    visit goals_url
    click_link 'Add Goal'
    expect(page).to have_content('Submit Goal')
  end

  scenario 'after adding a link redirects to goal show page' do
    visit goals_url
    click_link 'Add Goal'
    fill_in 'Body', with: "goal body for testing"
    click_on 'Submit Goal'
    expect(page).to have_content('goal body for testing')
  end
end
