# frozen_string_literal: true

require 'spec_helper'

feature 'Sessions  ' do
  let(:username) { 'testuser' }
  let(:email) { 'test66@test.com' }
  let(:password) { 'atestpassword' }
  let(:user) { User.new(username: username, password: password) }
  before do
    user.password = password
    user.save!
  end

  scenario 'a user can sign in ' do
    visit('/')
    click_on('Log In')
    expect(page.current_path).to eq('/sessions/new')
    fill_in 'username', with: user.username
    fill_in 'password', with: password
    click_button('Log In')
    expect(page.current_path).to eq('/')
    expect(page).not_to have_link('Sign Up', href: '/users/new')
    expect(page).not_to have_link('Log in', href: '/sessions/new')
  end

  scenario ' a user can log out' do 
    visit('/')  
    click_on('Log In')
    expect(page.current_path).to eq('/sessions/new')
    fill_in 'username', with: user.username
    fill_in 'password', with: password
    click_button('Log In')
     click_on 'Log Out!'
    expect(current_path).to eq '/'
    expect(page).not_to have_content "Welcome, #{user.username}"
    expect(page).to have_link('Sign Up', href: '/users/new')
    expect(page).to have_link('Log In', href: '/sessions/new')

  end
end
