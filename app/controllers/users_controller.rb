class UsersController < ApplicationController
  def new
  end

  def create
    puts "register params"
    puts params
    puts "user db"
    #@users = Users.all.orders
    puts @users
    puts "user db fin"


    user = User.new(user_params)

    # if validate_params(user_params)
    #   user = User.new(user_params)
    # end
    
    puts "NWE USER"
    puts user_params
    if user && user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  


  private

  # def validate_params(user_params)
  #   user_params[:password] == user_params[:password_confirmation]
  # end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
