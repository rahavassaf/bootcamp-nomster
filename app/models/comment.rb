class Comment < ApplicationRecord
	belongs_to :user
  	belongs_to :place

  	validates :message, presence: true, length: { maximum: 150, minimum: 10 }
  	validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0 }
  	validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  	validates :place_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
