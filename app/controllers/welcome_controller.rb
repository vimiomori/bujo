class WelcomeController < ApplicationController
  skip_before_action :require_login

  def home
    redirect_to user_path(current_user) if logged_in?
  end

  def about

  end

end