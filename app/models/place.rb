class PlaceValidator < ActiveModel::Validator
  def validate(record)
    if record.latitude.blank? || record.longitude.blank?
      record.errors.add(:address, 'could not be found')
    end
  end
end

class Place < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50, minimum: 3 }
	validates :address, presence: true, length: { maximum: 75,  minimum: 10 }
	validates :description, presence: true, length: { maximum: 500,  minimum: 10 }
	validates_with PlaceValidator
	
	belongs_to :user
	has_many :comments
	has_many :photos

	geocoded_by :address
	before_validation :geocode, if: :address_changed?
end
