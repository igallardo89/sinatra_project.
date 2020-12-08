
class MeditationsController < ApplicationController

  get "/meditation" do
    erb :'/meditation/index'
  end

  post "/meditation" do 
    erb :'/meditation/index'
  end

  get "/meditation/new" do 
    erb :'/meditation/new'
  end

  post "/meditation/new" do 
    erb :'/meditation/new'
  end





end
