class Like < ApplicationRecord
	belongs_to :user
  	belongs_to :place

  	validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  	validates :place_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
