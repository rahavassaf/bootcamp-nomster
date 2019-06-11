class Comment < ApplicationRecord
	  belongs_to :user
  	belongs_to :place
  	after_create :send_comment_email

  	validates :message, presence: true, length: { maximum: 150, minimum: 10 }
  	validates :rating, presence: true, :inclusion => 1..5
  	validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  	validates :place_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  	def send_comment_email
		NotificationMailer.comment_added(self).deliver_now
	end
end
