class UsersController < ApplicationController

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
    set_user
  end

  def show 
    set_user
  end

  def update
    set_user
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