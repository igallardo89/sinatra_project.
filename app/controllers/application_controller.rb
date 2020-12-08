require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    
  end

  get "/" do
    erb :welcome
  end
  get "/signin" do
    erb '/user/:login'
  end

  post "/signin" do
    erb '/user/:login'
  end

  get "/signup" do
    erb :new
  end
  
  post "/signup" do
    erb :new
  end
  



end
