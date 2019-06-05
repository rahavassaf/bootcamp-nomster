class RemoveJsonColumns < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :photos
  	remove_column :places, :photos
  end
end
