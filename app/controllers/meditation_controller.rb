
class MeditationsController < ApplicationController
   
  get '/meditations' do
    if logged_in?
      @user = current_user
      @meditations = @user.meditations
      erb :'/meditation/index'
    else
      redirect :'/login'
    end
  end

  get '/meditations/new' do
    if logged_in?
      erb :'/meditation/new'
    else 
      redirect :'/login'
    end
  end

  post '/meditations/new' do
    @user = current_user
    @meditation =  Meditation.create(date: params[:date], meditation_length: params[:meditation_length], time_of_day: params[:time_of_day], user: @user)
    if @meditation.save
      redirect :"/user/#{@user.slug}"
    else
      redirect :'/meditations/new'
    end
  end

  get '/meditations/:id' do
    if logged_in?
      @meditation = Meditation.find_by_id(params[:id])
     
      erb :'meditation/show'
    else
      redirect :'/login'
    end
  end
  
  get '/meditations/:id/edit' do
    @meditation = Meditation.find_by(id: params[:id])
    if logged_in? && @meditation.user == current_user
      erb :"/meditation/edit"
    else
      redirect to '/login'
    end
  end

  patch "/meditations/:id/edit" do
    @meditation = Meditation.find_by_id(params[:id])
    @user = current_user
    if @meditation.update(date: params[:date], meditation_length: params[:meditation_length], time_of_day: params[:time_of_day], user: @user)
      redirect :"/meditations/#{@meditation.id}"
    else
      redirect :"/meditations/#{@meditation.id}/edit"
    end
  end

  delete '/meditations/:id/delete' do
    meditation = current_user.meditations.find_by_id(params[:id])
    if meditation
       meditation.destroy
      redirect :'/meditations'
    else 
      redirect :"/meditations/#{params[:id]}"
    end
  end
end
