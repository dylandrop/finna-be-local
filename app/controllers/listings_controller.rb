class ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def index
    @q = Listing.search(params[:q])
    @listings = @q.result(:distinct => true)
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(params[:listing])
    @listing.save
    redirect_to @listing
  end
end
