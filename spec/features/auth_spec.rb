require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content('Sign Up')
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', with: 'test'
      fill_in 'Password', with: 'password'
      click_on 'Create User'
    end
    scenario "shows username on the homepage after signup" do
      expect(page).to have_content('test')
    end

    scenario "redirects to goals index" do
      expect(page).to have_content('All Goals!')
    end
  end

end

feature "logging in" do
  User.new(username: 'test', password: "password").save
  before(:each) do
    visit new_session_url
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: 'password'
    click_on 'Login!'
  end

  scenario "shows username on the homepage after login" do


    expect(page).to have_content('test')
  end

end

feature "logging out" do
  before(:each) do
    visit new_session_url
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: 'password'
    click_on 'Login!'
  end

  scenario "begins with a logged out state"


  scenario "doesn't show username on the homepage after logout" do
    visit goals_url
    click_on 'Log Out'
    expect(page).to have_content('Login')
    expect(page).to_not have_content('test')
  end

end
