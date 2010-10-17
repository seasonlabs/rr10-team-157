require 'nokogiri'
require 'open-uri'

class Link < ActiveRecord::Base
  belongs_to :user
end
