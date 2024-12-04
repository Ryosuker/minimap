module MapConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_map_data, only: :index
  end

  def set_map_data
    gon.latitude = 35.6813843233819
    gon.longitude = 139.76712479697295
    gon.api_key = ENV['GOOGLE_MAPS_API_KEY']
  end
end