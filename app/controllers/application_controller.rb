require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      register Sinatra::Flash
      enable :sessions
      set :session_secret, "pswd_sinatra"
    end

      get "/" do
        erb :welcome
      end
      
          helpers do 
            def logged_in?
              !!session[:user_id]
            end

            def current_user
              User.find(session[:user_id])
            end

            def authenticate
              redirect '/' if !logged_in?
            end
          end
end