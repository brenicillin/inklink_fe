class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome, #{user.name}!"
        redirect_to '/'
      else
        flash[:error] = "Your password is incorrect."
        redirect_to '/login'
      end
    else
      flash[:error] = "We don't have an account for that email."
      redirect_to '/login'
    end
  end
end