def log_in(user_type)

password= 'demopassword'
user = create(user_type,set_password:password)
visit'/'
click_on 'Log In'
  fill_in 'username', with: user.username
  fill_in 'password', with: password
  click_button 'Log In'

end



