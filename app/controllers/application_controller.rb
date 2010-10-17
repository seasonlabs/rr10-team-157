class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :user_stuff
  
  def user_stuff
    @links_count = Link.count  
  end
  
protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
  
  def access_token=(access_token)
    session[:access_token] = access_token
  end
  
  def access_token
    session[:access_token]
  end
end
