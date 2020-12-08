class UsersController < ApplicationController

  get "/login" do
    erb :'/user/login'
  end
    
  post "/login" do
    erb :'/user/login'
  end
    
  get "/signup" do
    if logged_in?
      redirect to :'/meditation'
    else 
     erb :'/user/new'
    end 
  end
 

  
end