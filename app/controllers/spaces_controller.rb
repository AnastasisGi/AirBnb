# frozen_string_literal: true

require 'sinatra/flash'
require 'sinatra/activerecord'
require_relative '../models/user'
# require_relative '../models/spaces'

class AirBnb < Sinatra::Base
  register Sinatra::Flash
  enable :sessions, :method_override




  get '/spaces/new' do
    erb(:spaces_new)
  end

  post '/spaces' do 
    space = Space.new(name: params[:name],description:params[:description],price:params[:price],host_id:session[:user_id])
    space.save!
    redirect'/'
  end


end
