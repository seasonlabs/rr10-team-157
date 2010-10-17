require 'nokogiri'
require 'open-uri'

class Link < ActiveRecord::Base
  belongs_to :user

  def title   
    self['title'].blank? ? 'Sorry, no page title found!' : self['title']
  end
  
end
