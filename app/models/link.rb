require 'net/http'
require 'uri'

class Link < ActiveRecord::Base
  belongs_to :user
  
  def sender
    '@' + self[:sender]
  end
  
  
end
