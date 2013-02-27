tags = ["apartments", "bikes", "for-sale", "free", "pool", "cars", "instruments", "condos", "houses", "lease", "pets", "computers", "labor", "contract", "web-development", "website", "motorcycles"]

tags.each do |tag|
  Tag.find_or_create_by_name(tag)
end