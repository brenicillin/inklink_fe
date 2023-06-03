class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Welcome, #{user.name}!"
    else
      flash[:alert] = "Invalid Credentials"
      render "/login"
    end
  end

  def destroy
    redirect_to root_path
  end
end