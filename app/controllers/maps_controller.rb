class MapsController < ApplicationController
  # マップの初期値（緯度経度等）をconcernに切り分けて記述してます。
  include MapConcern

  def index
    # 取得した緯度経度を浮動小数点に変換して、正常に扱えるようにします。
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f

    search_shops(latitude, longitude)

    respond_to do |format|
      format.html
      format.json do
        render json: {
          # clothes: @clothes.as_json(include: :shop_images), #⭐️元の記述
          # cafes: @cafes.as_json(include: :shop_images)      #⭐️元の記述
          cafes: @cafes.as_json(include: :work_place_images)      #⭐️あとで修正箇所
          cowork_speaces: @cowork_speaces.as_json(include: :work_place_images)      #⭐️あとで修正箇所
          libraries: @libraries.as_json(include: :work_place_images)      #⭐️あとで修正箇所
        }
      end
    end
  end

  private

  def search_shops(latitude, longitude)
    # セレクトショップとカフェそれぞれで検索をかけます。
    @clothes = circle_search(Clothes, latitude, longitude)   #⭐️元の記述
    @cafes = circle_search(Cafe, latitude, longitude)        #⭐️あとで修正箇所
    @cafes = circle_search(CoworkSpeace, latitude, longitude)        #⭐️あとで修正箇所
    @cafes = circle_search(Library, latitude, longitude)        #⭐️あとで修正箇所
  end

  def circle_search(model, latitude, longitude)
    # withinは、gem 'geokit-rails'のメソッドで、中心の緯度経度から指定した半径（サークルの半径と合わせる）内でのレコード検索を可能にするものです。
    # by_distanceも、gem 'geokit-rails'のメソッドで、原点からの距離順にレコードを検索するものです。
    model.includes(:shop_images).within(1, origin: [latitude, longitude]).by_distance(origin: [latitude, longitude])
  end
end