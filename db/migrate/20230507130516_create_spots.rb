class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.integer :user_id,               null: false, default: ""
      t.string :address,                null: false, default: ""
      t.float :latitude,                null: false, default: ""
      t.float :longitude,               null: false, default: ""

      t.timestamps
    end
  end
end
