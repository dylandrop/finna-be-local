class Listing < ActiveRecord::Base
  attr_accessible :body, :name, :seller_email, :zip
  has_many :taggings
  has_many :tags, through: :taggings
end
