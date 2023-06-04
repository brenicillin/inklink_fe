class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    uid = auth_hash['uid']
    provider = auth_hash['provider']
    email = auth_hash['info']['email']

    user = User.find_or_create_by(email: email)
    user.update(uid: uid, provider: provider)

    session[:user_id] = user.id

    redirect_to user_path(user)

  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.password != @user.password_confirmation
  #     flash[:alert] = "Passwords do not match!"
  #     render :new 
  #   elsif @user.save
  #     session[:user_id] = @user.id
  #     flash[:success] = "Welcome, #{@user.name}!"
  #     redirect_to user_path(@user)
  #   else
  #     flash[:alert] = @user.errors.full_messages.join(", ")
  #     render :new
  #   end
  # end

  # def omniauth
  #   user = User.from_omniauth(request.env['omniauth.auth'])
  #   if user
  #     session[:user_id] = user.id
  #     flash[:success] = "Welcome, #{user.name}!"
  #     redirect_to user_path(user)
  #   else
  #     flash[:error] = user.errors.full_messages.join(", ")
  #     redirect_to login_path
  #   end
  # end

  # def create
  #   user = User.find_by(email: params[:email])
  #   if user && user.authenticate(params[:password])
  #       session[:user_id] = user.id
  #       flash[:success] = "Welcome, #{user.name}!"
  #       redirect_to '/'
  #   elsif
  #       flash[:error] = "Your password is incorrect."
  #       redirect_to '/login'
  #   else
  #     flash[:error] = "We don't have an account for that email."
  #     redirect_to '/login'
  #   end
  # end
  
  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to user_path(user)
    else
      flash[:error] = "Information Incorrect!"
      redirect_to '/login'
    end
  end

  def logout_user
    session.delete(:user_id)
    redirect_to root_path
  end
end
