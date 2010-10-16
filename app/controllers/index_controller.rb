class IndexController < ApplicationController
  before_filter :redirect_links
  
  def redirect_links
    redirect_to links_url if signed_in?
  end
  
  def index
    render :layout => 'home'
  end
end
