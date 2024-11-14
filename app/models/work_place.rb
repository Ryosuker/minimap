class WorkPlace < ApplicationRecord
  #Gem geokit-rails
  acts_as_mappable default_units: :kms,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :latitude,
                   lng_column_name: :longitude

  has_many :shop_images, dependent: :destroy
  # has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :place_id, presence: true


  #半径10km以内の施設を検索
  def closest_shop(latitude, longitude)
    if type == 'Library'
      target_location = Geokit::LatLng.new(latitude, longitude)
      library_closest_shop = Library.where.not(id: self.id).closest(origin: target_location, units: :kms, within: 10).first
      library_closest_shop
    elsif  type == 'Cafe'
      target_location = Geokit::LatLng.new(latitude, longitude)
      cafe_closest_shop = Cafe.where.not(id: self.id).closest(origin: target_location, units: :kms, within: 10).first
      cafe_closest_shop
    elsif  type == 'Cowork_speace'
      target_location = Geokit::LatLng.new(latitude, longitude)
      cowork_speace_closest_shop = CoworkSpeace.where.not(id: self.id).closest(origin: target_location, units: :kms, within: 10).first
      cowork_speace_closest_shop
    end
  end
end
