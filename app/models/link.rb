require 'nokogiri'
require 'open-uri'

class Link < ActiveRecord::Base
  belongs_to :user

  def title   
    self['title'].blank? ? 'Sorry, no page title found!' : self['title']
  end
  
  def url
    if self['url'].blank?
      self['short_url']
    else
      self['url']
    end
  end
  
end
