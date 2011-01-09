class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    
    # Log the authorizing user in.
    self.current_user = @auth.user
    access_token = request.env['omniauth.auth']['extra']['access_token']
    
    self.current_user.get_links(access_token)
    
    redirect_to links_url
  end
  
  def destroy
    reset_session
    flash[:notice] = "You've been signed out"

    redirect_to root_url
  end
  
  def failure
    render :text => "Authentication Failure!"
  end
end
