class AlterPlaceAddUserId < ActiveRecord::Migration[5.2]
  def change
  	add_column :places, :user_id, :integer
  	add_index :places, :user_id
  	add_index :places, :id
  	add_index :places, :name
  end
end
