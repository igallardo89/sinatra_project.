
class MeditationsController < ApplicationController

  get "/meditations" do
    authenticate
    @user = current_user
    @meditations = Meditations.all 
    erb :'/meditation/index'
  end

  get "/meditations/new" do 
    authenticate
    @meditation = Meditation.new
    erb :'/meditation/new'
  end

    post "/meditations" do 
      @meditation = Meditation.create(date: params[:date], meditation_length: params[:meditation_length], time_of_date: params[:time_of_date])
        if @meditation.error.any?
          erb :'/meditation/new'
        else
          erb :'/meditation/show'
        end
      end

    get "/meditations/:id" do
      authenticate
      @meditation = Meditation.find_by_id(params[:id]) 
      erb :'/meditation/show'
    end

    get "/meditations/:id/edit" do 
      @meditationn = Meditation.find_by(id: params[:id])
      authenticate
      if logged_in? && @meditationn.user_id == current_user.id
        erb :'meditation/edit'
      end
  


     


end
