require 'oauth'

module Auth
  module Linkodrama
    class Twitter  
      # Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
      def self.prepare_access_token(oauth_token, oauth_token_secret)
        consumer = OAuth::Consumer.new("APIKey", "APISecret",
          { :site => "http://api.twitter.com",
            :scheme => :header
          })
        # now create the access token object from passed values
        token_hash = { :oauth_token => oauth_token,
                       :oauth_token_secret => oauth_token_secret
                     }
        access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
        return access_token
      end
    end
  end
end