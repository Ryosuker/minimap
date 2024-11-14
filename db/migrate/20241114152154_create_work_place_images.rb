class CreateWorkPlaceImages < ActiveRecord::Migration[7.0]
  def change
    create_table :work_place_images do |t|
      t.string :image
      t.references :work_place, foreign_key: true
      t.timestamps
    end
  end
end
