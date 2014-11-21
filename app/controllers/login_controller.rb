class LoginController < ApplicationController
  def show
    if @logged_in
      #redirect_to products_url
    end
  end
end
