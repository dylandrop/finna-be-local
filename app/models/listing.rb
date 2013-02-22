class Listing < ActiveRecord::Base
  attr_accessible :body, :name, :seller_email, :zip, :tag_ids
  has_many :taggings
  has_many :tags, through: :taggings
  
  def self.by_tag tag_string
    tag_string = "\"" + tag_string.split(",").join("\",\"") + "\""
    joins("LEFT JOIN taggings ON taggings.listing_id = listings.id").joins('LEFT JOIN tags ON tags.id = taggings.tag_id AND tags.name IN ('+tag_string+')').group(:id).order("count(tags.id), name DESC").reverse
  end
end
