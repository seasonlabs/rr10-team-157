class IndexController < ApplicationController
  before_filter :redirect_links
  
  def redirect_links
    redirect_to links_url if signed_in?
  end
  
  def index
    @linkodrama_news = ActiveSupport::JSON.decode(open('http://twitter.com/statuses/user_timeline/linkodrama.json?count=3'))
    
    render :layout => 'home'
  end
end
