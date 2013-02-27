module ApplicationHelper
  def tag_names
    raw Tag.pluck(:name).to_s
  end
end
