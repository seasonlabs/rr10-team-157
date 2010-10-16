require 'nokogiri'
require 'open-uri'

class Link < ActiveRecord::Base
  belongs_to :user
  
  def sender
    self[:sender]
  end
  
  def title
    
    if self['title'].blank?
      begin
        doc = Nokogiri::HTML(open(self['short_url']))
        
        self['title'] = doc.css('title').children.text
        save
      rescue
        self['title']
      end
    end
    
    self['title'].blank? ? 'Sorry, no page title found!' : self['title']
  end
  
  
end
