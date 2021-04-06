class SessionsController < ApplicationController

  def new
  end

  # def create
  #   user = User.find_by_email(params[:email])
  #   # If the user exists AND the password entered is correct.
  #   if user && user.authenticate(params[:password])
  #     # Save the user id inside the browser cookie. This is how we keep the user 
  #     # logged in when they navigate around our website.
  #     session[:user_id] = user.id
  #     redirect_to '/'
  #   else
  #   # If user's login doesn't work, send them back to the login form.
  #     redirect_to '/login'
  #   end
  # end

  def create
    #if user = authenticate_with_credentials(params[:email], params[:password])
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      puts "DANS SESSION"
      puts user[:id]
      session[:user_id] = user[:id]
      redirect_to '/'
      # success logic, log them in

    else
      # failure, render login form
      puts "dans session marche pas"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  # def authenticate_with_credentials(email, password)
  #   user = User.find_by_email(email)
  #   if user && user.authenticate(password)
  #     session[:user_id] = user.id
  #   else
  #     return false
  #   end
  # end
  
end
