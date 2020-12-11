class UsersController < ApplicationController

  get "/signup" do 
    if logged_in? 
      redirect to :'/meditations'
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

    get '/login' do 
      if logged_in?
        redirect :'/meditations'
      else
        erb :'/users/login'
      end
    end

    post '/login' do 
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params [:password])
          session[:user_id] = @user.id
          redirect :'/meditations'
        else
          flash[message] = "Failed attempt, please try again"
          erb :'/user/login'
        end
      end

      get '/logout' do
        session.clear
        redirect '/'
      end
   
        #Patch

        #delete 
        #gives the user the option to delete account.
        # end 
  
end