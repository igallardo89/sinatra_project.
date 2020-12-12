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
       if @user.save
        session[:user_id] = @user.id
        redirect to "/meditations"
       else
        redirect :'/'
      end
  end

    get '/login' do   
      redirect :'/meditations' if logged_in?
      erb :'/user/login'
    end

    post '/login' do 
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect :'/meditations'
        else
          redirect to :'/login'
        end
      end

      get '/logout' do
        session.clear
        redirect '/'
      end
   
  
end