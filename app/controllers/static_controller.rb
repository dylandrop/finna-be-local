class StaticController < ApplicationController
  def home
    @q = Listing.search(params[:q])
  end
end
