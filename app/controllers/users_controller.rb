require './config/environment'
class UsersController < Sinatra::Base
    
  get "/signin" do
    erb :login
  end

  post "/signin" do
    erb :login
  end

  get "/signup" do
    erb :new
  end
  
  post "/signup" do
    erb :new
  end
end
