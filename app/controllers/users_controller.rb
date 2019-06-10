class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:edit]

	def show
		@user = User.find(params[:id])
		@itisme = user_signed_in? && @user.id == current_user.id
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
