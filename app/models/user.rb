class User < ActiveRecord::Base
  validates_uniqueness_of :uid, :scope => :provider

  def user_params
    params.require(:user).permit(:name, :email, :provider, :uid, :oauth_token, :oauth_expires_at)
  end
end