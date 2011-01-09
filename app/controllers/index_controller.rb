class IndexController < ApplicationController
  before_filter :redirect_links
  
  def redirect_links
    redirect_to links_url if signed_in?
  end
  
  def index
    
    if params[:refresh] == 'twitter'
      redirect_to '/auth/twitter' 
    else
      begin
        @linkodrama_news = ActiveSupport::JSON.decode(open('http://twitter.com/statuses/user_timeline/linkodrama.json?count=3'))
      rescue
        @linkodrama_news = Array.new
      end
    
      render :layout => 'home'
    end
  end
end
