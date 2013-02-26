class ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def index
    if !params[:q].nil? && zip_is_valid?(params[:q][:zip])
      @zip = params[:q][:zip]
    end
    @listings = Listing.zip_near(params[:q][:zip]).named_like(params[:q][:name]).by_tag(params[:tags])
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    tags = params[:tags]
    tag_ids = Tag.ids_from_string(tags)
    params[:listing].delete :tags
    @listing = Listing.new(params[:listing])
    @listing.tag_ids = tag_ids
    @listing.save
    redirect_to @listing
  end

  private

  def zip_is_valid? zip
    return zip =~ /^\d+$/ && zip.length == 5
  end
end
