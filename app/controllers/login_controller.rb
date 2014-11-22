class LoginController < ApplicationController
  layout "login"

  def show
    if @logged_in
      redirect_to home_show_url
    end
  end
end
