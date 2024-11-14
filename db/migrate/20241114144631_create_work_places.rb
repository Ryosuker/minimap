class CreateWorkPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :work_places do |t|

      t.timestamps
    end
  end
end
