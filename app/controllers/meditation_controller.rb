
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
    

     


end
