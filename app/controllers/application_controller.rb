require './config/environment'
require 'sinatra/flash'

# A Application Controller is simply a Ruby Class that inherits from Sinatra::Base.
# This inheritance transforms our plain old Ruby class into a web application by giving it a Rack-compatible interface through
# inheriting from the "base" of the Sinatra framework. It define the HTTP interface for our application are called Controllers

# The two most common 

class ApplicationController < Sinatra::Base
# set public folder - you to access the directory without typing the whole directory path 
# set views allow - you to access the view directory without typing the whole directory path
# set method_overide, true - rack method overide that allows your forms to have hidden actions
# set sessions - keeps information about the current user. for example that allows them to stay logged in
# set session_secret - encrypts stored session data
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
		set :session_secret, "password_security"
  end

  # Renders Home Page
  get "/" do #Landing Page 
    erb :welcome
  end

   helpers do
		def logged_in?
			!!session[:user_id]
      # it just checks to see if someone is logged in
		end

    def current_user
    User.find(session[:user_id])
      #  grabs the current user
		end
	end

end
