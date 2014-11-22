class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]

    domain = auth[:info][:email].split("@")[1]
    if domain != "campus.fct.unl.pt" and domain != "fct.unl.pt" and domain != "gmail.com"
      notice = "E-mail does not contain a whitelisted domain"
      logger.debug "#{auth[:info][:name]} failed to login due to a non-whitelisted e-mail"
      redirect_to root_path, :notice => notice
    else

      user =
          User.where(:provider => auth[:provider], :uid => auth[:uid])
              .first_or_initialize(
                  :oauth_token => auth[:credentials][:token],
                  :oauth_expires_at => Time.at(auth[:credentials][:expires_at]),
                  :name => auth[:info][:name],
                  :email => auth[:info][:email]
              )

      url = session[:return_to] || root_path
      session[:return_to] = nil
      url = root_path if url.eql?('/logout')

      if user.save
        session[:user_id] = user.id
        notice = "Signed in!"
        logger.debug "URL to redirect to: #{url}"
        redirect_to url, :notice => notice
      else
        raise "Failed to login"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end