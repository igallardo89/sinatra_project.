class UsersController < ApplicationController

  get "/signup" do 
    if logged_in? 
      redirect to :'/meditations'
    else
      erb :'/user/new'
    end 
  end

  post "/signup" do
    @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
       if @user.errors.any?
        session[:user_id] = @user.id
        redirect_to :'/user/new', notice: "User not found. Please try again"
       else
        session[:user_id] = @user.id
        redirect :'/meditations'
      end
  end

    get '/login' do 
      if logged_in?
        redirect :'/meditations'
      else
        erb :'/user/login'
      end
    end

    post '/login' do 
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect :'/meditations'
        else
          redirect to :'/user/login'
        end
      end

      get '/logout' do
        session.clear
        redirect '/'
      end
   
  
end