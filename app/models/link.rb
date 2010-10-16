require 'nokogiri'
require 'open-uri'

class Link < ActiveRecord::Base
  belongs_to :user
  
  def sender
    self[:sender]
  end
  
  def title
    begin
      doc = Nokogiri::HTML(open(self['short_url']))
      
      doc.css('title').children.text
    rescue
      self['title']
    end
  end
  
  
end
