class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings
  has_many :listings, through: :taggings

  def self.ids_from_string tag_string
    tag_string = "\'" + tag_string.split(",").join("\', \'") + "\'"
    where("name in ("+tag_string+")").pluck(:id)
  end
end