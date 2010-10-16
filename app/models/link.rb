class Link < ActiveRecord::Base
     # Exchange our oauth_token and oauth_token secret for the AccessToken instance.
    access_token = Auth::Linkodrama::Twitter.prepare_access_token(APP_CONFIG["twitter"]["consumer_key"], APP_CONFIG["twitter"]["consumer_secret"])
    # use the access token as an agent to get the home timeline
    response = access_token.request(:get, "http://api.twitter.com/1/statuses/home_timeline.json")
  
end
