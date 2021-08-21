# frozen_string_literal: true

class AirBnb < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :root, File.dirname(File.expand_path(__dir__))

  enable :sessions


   def current_user
    User.find_by(id: session[:user_id])
  end

 
end
