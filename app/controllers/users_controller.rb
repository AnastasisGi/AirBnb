# frozen_string_literal: true

require 'sinatra/flash'
require 'sinatra/activerecord'
require_relative '../models/user'
require_relative '../models/space'

class AirBnb < Sinatra::Base
  register Sinatra::Flash
  enable :sessions, :method_override
  get '/' do
    @spaces=Space.all
    erb(:index)
  end

  get '/users/new' do
    erb(:users_new)
  end

  get '/sessions/new' do
    erb(:sessions_new)
  end

  post '/users' do
    user = User.new(username: params[:username], email: params[:email])
    user.password = params[:password]
    user.save!
    session[:user_id] = user.id
    redirect('/')
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id

      redirect '/'
    else
      flash[:error] = ERROR_LIST[:login_error]
      redirect 'sessions/new'
    end
  end

  delete '/sessions' do 
    session.delete(:user_id)
    redirect '/'
  end

end
