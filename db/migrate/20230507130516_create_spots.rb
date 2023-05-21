class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.integer :user_id,               null: false, default: 0
      t.string :address,                null: false, default: ""
      t.float :latitude,                null: false, default: 0
      t.float :longitude,               null: false, default: 0

      t.timestamps
    end
  end
end
