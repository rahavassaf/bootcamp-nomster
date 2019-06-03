class RatingIntegerToFloat < ActiveRecord::Migration[5.2]
  def change
  	change_column :comments, :rating, :float
  end
end
