require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
		set :session_secret, "password_security"
  end

  # Renders Home Page
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
	end

end
