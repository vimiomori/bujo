class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      flash[:succss] = "Welcome back, #{@user.username}"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:danger] = "Incorrect login information."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out."
    redirect_to root_path
  end

end