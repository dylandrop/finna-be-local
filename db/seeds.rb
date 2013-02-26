tags = ["apartments", "bikes", "for-sale", "free", "williamsburg", "upper-west-side", "pool"]

tags.each do |tag|
  Tag.find_or_create_by_name(tag)
end