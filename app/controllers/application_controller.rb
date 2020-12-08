require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    
  end

  get "/" do
    erb :welcome
  end

  get "/login" do
    erb :'/user/login'
  end

  post "/login" do
    erb :'/user/login'
  end


end
