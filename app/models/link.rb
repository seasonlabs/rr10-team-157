require 'nokogiri'
require 'open-uri'

class Link < ActiveRecord::Base
  acts_as_paranoid
  cattr_reader :per_page
  attr_accessor :count
  
  belongs_to :user
  
  scope :default, lambda {
    limit(500).group(:short_url).order('post_date DESC')
  }
  
  def self.search(search)
    if search
      default.where(['url LIKE ?', "%#{search}%"])
    else
      default
    end
  end  
end
