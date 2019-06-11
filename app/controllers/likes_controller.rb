class LikesController < ApplicationController
	before_action :authenticate_user!

	def create
		@place = Place.find(params[:place_id])

		@like = @place.likes.create(:user_id => current_user.id, :place_id => @place.id)
		
		redirect_to request.referrer
	end

	def destroy
		@like = Like.find(params[:id])

		if @like.user != current_user
			return render plain: 'Not Allowed', status: :forbidden
		end

		@like.destroy

		redirect_to request.referrer
	end
end
