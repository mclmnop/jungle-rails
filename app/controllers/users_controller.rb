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
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
