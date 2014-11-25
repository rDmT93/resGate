class FollowerController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @following = @user.fws.order("name asc")
    @followers = @user.inverse_fws.order("name asc")
  end
end
