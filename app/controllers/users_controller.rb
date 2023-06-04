class UsersController < ApplicationController
  def show
    @user = current_user
  end
  
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_path(user)
    else
      flash[:alert] = "All fields must be filled in."
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :city)
  end
end