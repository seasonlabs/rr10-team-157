class User < ActiveRecord::Base
  has_many :authorizations
  has_many :links
  
  def self.create_from_hash!(hash)
    create(:name => hash['user_info']['name'])
  end
  
  def get_links(access_token)
    since_id = ""
    
    # use the access token as an agent to get the friends timeline
    auth = authorizations.find_by_provider(:twitter)

    since_id = "&since_id=#{auth.last_oid}" unless auth.last_oid.blank?

    response = access_token.request(:get, "http://api.twitter.com/1/statuses/friends_timeline.json?count=200" + since_id)
    
    posts = ActiveSupport::JSON.decode(response.body)
    
    posts.each do |post|
      #begin
        if link = post['text'].match(/(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/[a-zA-Z0-9$_.+!*,;\?:@&~=%-\/]*)?/)
          #create the link in the db if it doesn't exist
          links.create(
            :short_url => link.to_s, 
            :title => '', 
            :description => post['text'], 
            :sender => post['user']['screen_name'], 
            :post_id => post['id'], 
            :post_date => post['created_at']
          ) if links.find_by_post_id(post['id']).nil?
        end
      #rescue
      #end
    end
    
    auth.last_oid = posts.last['id']
    auth.save!
  end
end
