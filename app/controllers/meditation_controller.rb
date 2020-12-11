
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
      @meditation = Meditation.find_by(id: params[:id])
      authenticate
      if logged_in? && @meditation.user_id == current_user.id
        erb :'/meditation/edit'
      else 
        flash[message] = "Something went wrong, try again"
        erb :'/meditation/show'
      end
    end
  
   patch "/meditation/:id" do 
    @meditation = Meditation.find_by(id: params[:id])
    @meditation.update(date: params[:date], meditation_length: params[:meditation_length], time_of_date: params[:time_of_date])
      if @meditation.errors.any?
        flash[message]="Try again."
        erb :'/meditation/edit'
      else
        erb :'/meditation/show'
      end
    end
    
    delete "/meditations/:id" do 
      meditation = Meditation.find_by(id: params[:id])
        if meditation.user_id == current_user.id
          meditation.destroy 
        redirect '/meditations'
    end
  end

end
