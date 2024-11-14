class CreateWorkPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :work_places do |t|
      t.string :name, null: false #施設名
      t.string :postal_code       #郵便番号
      t.string :area              #市町村と東京23区
      t.string :address           #住所
      t.string :phone_number      #電話番号
      t.string :opening_hours     #営業時間
      t.string :web_site          #ウェブサイト
      t.decimal :latitude, precision: 10, scale: 7, null: false #緯度
      t.decimal :longitude, precision: 10, scale: 7, null: false #経度
      t.string :place_id, null: false #プレイスID
      t.timestamps
    end
  end
end
