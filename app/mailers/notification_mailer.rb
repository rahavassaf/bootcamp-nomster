class NotificationMailer < ApplicationMailer
	default from: "assaf.rahav.bootcamp@gmail.com"

	def comment_added comment
		@c = comment
		mail(to: comment.place.user.email,
         subject: "[Nomster] A comment has been added to [#{@c.place.name}]")
  	end
end
