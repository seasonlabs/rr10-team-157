require 'nokogiri'
require 'open-uri'

class Link < ActiveRecord::Base
  cattr_reader :per_page
  
  belongs_to :user
end
