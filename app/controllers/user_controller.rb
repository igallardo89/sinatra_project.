class UsersController < ApplicationController

  get "/signup" do 
    if logged_in? 
      redirect to '/meditations'
    else
      erb :'/user/new'
    end 
  end

  post "/signup" do
    @user = User.new(:username => params[:username], :email => parmas[:email], :password => parmas[:password])
       if user.errors.any?
        session[:user_id] = @user.id
        flash[message]= "Try again"
        erb :'/user/new'
       else
        session[:user_id] = @user.id
        redirect :'/meditations'
      end
  end

         
      
      
    
  #get "/login" do
    #erb :'/user/login'
    #this find the user id  then redirect to show the session
    #redirect to sign up if they arent a user
  #end
    
  #post "/login" do
   # erb :'/user/login'
    #show the meditations affiliated with the user 
    #redirect to signup 
  #end

  #patch/put 
   # edit - meditation/edit 
  #end 

  #delete 
  #gives the user the option to delete account.
# end 
    


  
end