require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "pswd_sinatra"
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

  get "/signup" do
    erb :'/user/new'
  end



end
