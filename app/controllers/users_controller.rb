# frozen_string_literal: true
require 'sinatra/activerecord'
require_relative '../models/user.rb'
class AirBnb < Sinatra::Base
  enable :sessions
  get '/' do
    erb(:index)
  end

  get '/users/new' do
    erb(:users_new)
  end

  post '/users' do
    user = User.new(username: params[:username], email: params[:email])
    user.password = params[:password]
    user.save!
    session[:user_id] = user.id
    redirect('/')
  end
end
