
class MeditationsController < ApplicationController

  get "/meditations" do
    authenticate
    @user = current_user
    @meditations = Meditation.all 
    erb :'/meditation/index'
  end

  get "/meditations/new" do 
    authenticate
    @meditation = Meditation.new
    erb :'/meditation/new'
  end

    post "/meditations/new" do 
      @meditation = Meditation.create(date: params[:date], meditation_length: params[:meditation_length], time_of_day: params[:time_of_day])
      #if @meditation.errors.any?
       #   erb :'/meditation/new'
        #else
          erb :'/meditation/show'
      end

    get "/meditations/:id" do
      if logged_in? 
        @meditation = Meditation.find_by_id(params[:id])
        erb :'/meditation/show'
      else
        flash[:error] = "You must be logged in to view meditations"
        redirect '/login'
    end
  end


    get "/meditations/:id/edit" do 
      @meditation = Meditation.find_by_id(params[:id])
      authenticate
      if logged_in? && @meditation.user_id == current_user.id
        erb :'/meditation/edit'
      else 
        redirect to '/login'
      end
    end
  
    patch "/meditations/:id" do 
      @meditation = Meditation.find_by_id(params[:id])
      @meditation.update(date: params[:date], meditation_length: params[:meditation_length], time_of_day: params[:time_of_day])
        if @meditation.errors.any?
          erb :'/meditation/edit'
        else
          erb :'/meditation/show'
        end
      end

    delete "/meditations/:id" do 
      meditation = Meditation.find_by_id (params[:id])
        if meditation.user_id == current_user.id
          meditation.destroy 
        redirect :'/meditations'
      end
    end
  end

