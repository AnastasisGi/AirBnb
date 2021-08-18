class AirBnb < Sinatra::Base
  enable :sessions
  enable :method_override
    get '/' do 
      erb(:index)
    end


    get '/users/new' do
        erb(:users_new)
    end

    post '/users' do 

# create the user things
    end


end