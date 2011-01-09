require 'nokogiri'
require 'open-uri'

class Link < ActiveRecord::Base
  acts_as_paranoid
  cattr_reader :per_page
  attr_accessor :count
  
  belongs_to :user
  
end
