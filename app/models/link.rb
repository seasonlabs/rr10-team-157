require 'nokogiri'
require 'open-uri'

class Link < ActiveRecord::Base
  belongs_to :user
  #before_save :request_values

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
  
private

  def request_values
    begin
      site = open(self.short_url)
      doc = Nokogiri::HTML(site)
      
      self.title = doc.css('title').children.text
      self.url = site.base_uri
    rescue
    end
  end
end
