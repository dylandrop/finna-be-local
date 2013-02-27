class Listing < ActiveRecord::Base
  include PgSearch

  attr_accessible :body, :name, :seller_email, :zip, :tag_ids
  has_many :taggings
  has_many :tags, through: :taggings

  pg_search_scope :search_by_name, against: :name, using: { tsearch: { any_word: true }} 

  scope :named_like, (lambda do |name| 
    if name.present?
      self.search_by_name(name)
    end
  end)

  scope :zip_near, (lambda do |zip| 
    if zip.present?
      self.where(zip: zip)
    end
  end)

  scope :by_tag, (lambda do |tag_string| 
    if tag_string.present?
      tag_string = "\'" + tag_string.split(",").join("\', \'") + "\'"
      self.joins("LEFT JOIN taggings ON taggings.listing_id = listings.id").joins('LEFT JOIN tags ON tags.id = taggings.tag_id AND tags.name IN ('+tag_string+')').group("listings.id").order("count(tags.id) DESC")
    end
  end)
end
