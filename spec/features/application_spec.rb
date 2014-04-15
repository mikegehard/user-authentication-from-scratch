require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'User registration' do
  scenario 'User can register and log out' do
    visit '/'

    expect(page).to have_content 'You are not logged in'

    click_link 'Register'

    fill_in 'email', :with => 'user@example.com'
    fill_in 'password', :with => 'my_password'
    click_button 'Register'

    expect(page).to have_content 'Welcome, user@example.com'

    click_link 'Log out'

    expect(page).to_not have_content 'Welcome, user@example.com'
    expect(page).to have_content 'You are not logged in'
  end
end