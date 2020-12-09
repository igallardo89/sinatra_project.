class UsersController < ApplicationController

  get "/signup" do 
    erb :'/user/new'
  end

  post "/signup" do
    @user = User.new(:username => params[:username], :email => parmas[:email], :password => parmas[:password])
    if user.save
      redirect to '/login'
    else 
      flash[message] = "Seems like something wrong try again"
      redirect to 'signup'
   # needs to create the user and the eventually login them in to acount 
   # give the option of redirecting to main page
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