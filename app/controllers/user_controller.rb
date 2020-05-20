# inherits application controller
class UserController < ApplicationController

# Renders Sign up page
get "/signup" do
    erb :'/user/signup'
end

# Verifies if required fields are populated (username, password, email)  
post "/signup" do
# If any require fields are null it will navigate to failure page
  if User.find_by(email: params[:email]) == nil || User.find_by(username: params[:username]) == nil

      if params[:username]=="" || params[:password]=="" || params[:email]==""
        redirect to "/failure"
      else 
        # If all required fields are populated then it will navigate to account page
        user = User.create(:email => params[:email], :username => params[:username], :password => params[:password])
        session[:user_id] = user.id
        redirect to "/books"
      end 
      
  else
    redirect to "/failure"
  end



end

# Renders login page
get "/login" do
erb :'/user/login'

end

# 6. Verifies user login information
post "/login" do
user = User.find_by(:username => params[:username])
if user && user.authenticate(params[:password])
  # If user password is authenticated then it will navigate to account page
  session[:user_id] = user.id
  redirect to "/books"

else
  # If user password is not authenticated then it will navigate to failure page
  redirect to "/failure"
end
end


get "/failure" do
erb :'/error/failure'
end


# 8. Renders logout page
get "/logout" do
    session.clear
    redirect "/"
end

end