class RemoveUserIdFromFollows < ActiveRecord::Migration[6.1]
  def change
    remove_column :follows, :user_id, :integer
  end
end
