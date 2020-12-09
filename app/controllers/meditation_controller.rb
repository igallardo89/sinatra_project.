
class MeditationsController < ApplicationController

  get "/meditations" do
      authenticate
      @user = current_user
      @meditations = Meditations.all 
      erb :'/meditation/index'
  end

  post "/meditations" do 
    erb :'/meditation/index'
  end

  get "/meditations/new" do 
    erb :'/meditation/new'
  end

  post "/meditations/new" do 
    erb :'/meditation/new'
  end


end
