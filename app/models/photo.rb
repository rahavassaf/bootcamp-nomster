class Photo < ApplicationRecord
	belongs_to :user
	belongs_to :place

	mount_uploader :picture, PhotoUploader

	validates :caption, presence: true, length: { maximum: 50, minimum: 5 }
  	validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  	validates :place_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
