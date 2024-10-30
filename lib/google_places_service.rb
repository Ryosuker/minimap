require 'http'

class GooglePlacesService
  BASE_URL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"

  def initialize(api_key = ENV['GOOGLE_MAPS_API_KEY'])
    @api_key = api_key
  end

  def search_nearby_places(lat, lng, keyword = "", radius = 1500, type = "cafe")
    response = HTTP.get(BASE_URL, params: {
      location: "#{lat},#{lng}",
      radius: radius,
      keyword: keyword,
      type: type,
      key: @api_key
    })
    
    if response.status.success?
      JSON.parse(response.body.to_s)
    else
      raise "Google Places API request failed: #{response.status}"
    end
  end
end