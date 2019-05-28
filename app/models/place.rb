class Place < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50, minimum: 3 }
	validates :address, presence: true, length: { maximum: 75,  minimum: 10 }
	validates :description, presence: true, length: { maximum: 500,  minimum: 10 }
end
