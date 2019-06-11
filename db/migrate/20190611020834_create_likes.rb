class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
	  t.integer :user_id
      t.integer :place_id
      t.timestamps
    end
    
    add_index :likes, [:user_id, :place_id]
    add_index :likes, :place_id
    add_index :likes, :user_id
  end
end
