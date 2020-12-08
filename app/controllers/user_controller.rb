class UsersController < ApplicationController

    get "/" do
        erb :welcome
      end
    
      get "/login" do
        erb :'/user/login'
      end
    
      post "/login" do
        erb :'/user/login'
      end
    
      get "/signup" do
        erb :'/user/new'
      end
  
end