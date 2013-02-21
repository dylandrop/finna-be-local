class ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def index
    if !params[:q].nil? && zip_is_valid?(params[:q][:zip])
      puts "hey"
      @zip = params[:q][:zip]
      params[:q].delete(:zip)
      @q = Listing.where(zip: @zip).search(params[:q])
    else
      params[:q].delete(:zip) if params[:q]
      @q = Listing.search(params[:q])
    end
    @listings = @q.result(:distinct => true)
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
