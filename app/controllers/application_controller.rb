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
    erb :login
  end

  post "/signin" do
    erb :login
  end

  get "/signup" do
    erb '/user/:new'
  end
  
  post "/signup" do
    erb '/user/:new'
  end



end
