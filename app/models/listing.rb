class Listing < ActiveRecord::Base
  attr_accessible :body, :name, :seller_email, :zip
end
