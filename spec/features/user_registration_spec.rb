require_relative '../spec_helper.rb'
feature 'A new user can sign up ' do
    
    
    
    scenario 'a user can sign up ' do
        visit('/')
        click_on('Sign Up')
        expect(page.current_path).to eq('/users/new')
        fill_in('email', with:'test@test.com')
        fill_in('password', with:'password123')
        click_button('Sign Up')
        expect(page.current_path).to eq('/')
        expect(page).not_to_have_link('Sign Up', href:'/users/new')
        expect(page).not_to_have_link('Log in', href:'/sessions/new')


    end


end
