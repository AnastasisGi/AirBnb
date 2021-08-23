# frozen_string_literal: true

require 'sinatra/activerecord'
require_relative '../models/user'
class AirBnb < Sinatra::Base
  enable :sessions
  get '/' do
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
      redirect 'sessions/new'
    end
  end
end
