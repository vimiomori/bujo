class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, #{@user.username}"
      redirect_to user_journal_entries_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def show 
  end

  def update
    if @user.update(user_params)
      flash[:success] = "#{@user.username}, your account has been successfully updated!"
      redirect_to user_journal_entries_path
    else
      render 'edit'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit!
    end

end