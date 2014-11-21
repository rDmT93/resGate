class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :login_check
  before_filter :current_user

  def user_signed_in?
    not session[:user_id].nil?
  end

  def login_check
    @logged_in = user_signed_in?
  end

  def current_user
    if user_signed_in?
      @c_user = User.find(session[:user_id])
    end
  end
end