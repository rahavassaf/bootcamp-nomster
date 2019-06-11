class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :my_favorites, :setavatar]

	def show
		@user = User.find(params[:id])
		@itisme = user_signed_in? && @user.id == current_user.id
	end

	def my_favorites
		# this one was interesting lol
		@places = Place.where(id: User.find(current_user.id).likes.pluck(:place_id)).paginate(page: params[:page], per_page: 10)
	end

	def setavatar
		@user = User.find(params[:id])

		if current_user != @user
			return render plain: 'Not Allowed', status: :forbidden
		end

		@user.update(params.require(:user).permit(:picture))

		redirect_to request.referrer
	end
end
