# frozen_string_literal: true

require 'spec_helper'

feature 'A new user can sign up ' do
  scenario 'a user can sign up ' do
    visit('/')
    # puts page.body
    click_on('Sign Up')
    expect(page.current_path).to eq('/users/new')
    fill_in('username', with: 'testuser')

    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password123')
    fill_in('password confirmation', with: 'password123')

    click_button('Sign Up')
    expect(page.current_path).to eq('/')
    expect(page).not_to have_link('Sign Up', href: '/users/new')
    expect(page).not_to have_link('Log in', href: '/sessions/new')
  end
end
