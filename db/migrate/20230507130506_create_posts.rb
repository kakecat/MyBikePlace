class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id,                null: false, default: 0
      t.integer :spot_id,                null: false, default: 0
      t.text :content,                   null: false, default: ""

      t.timestamps
    end
  end
end
