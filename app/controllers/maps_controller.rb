class MapsController < ApplicationController
  def index
    @places = []
    if params[:latitude].present? && params[:longitude].present?
      places_service = GooglePlacesService.new
      result = places_service.search_nearby_places(params[:latitude], params[:longitude], "study cafe")
      @places = result["results"] if result["status"] == "OK"
    end
  end
end
