class UsersController < ApplicationController

    get '/signup' do 
      if logged_in? 
        redirect :'/meditations'
      else 
        erb :'/user/new'
      end
    end
    
    post '/signup' do
      @user = User.new(params)
      if @user.save
        session[:id] = @user.id
        redirect :'/meditations'
      else
        flash[:message]="Please fill out all fields to create an account."
        redirect :'/signup'
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
        session[:id] = @user.id 
        redirect :'/meditations'
      else
        flash[:error]="Please try again. No login found."
        erb :'/user/login'
      end
    end

    get '/user/:slug' do 
      @user = User.find_by_slug(params[:slug])
      redirect :'/meditations'
    end

    get "/logout" do 
      if logged_in?
        session.clear
        redirect :'/login'
      else
        redirect :'/'
      end
    end
  end

