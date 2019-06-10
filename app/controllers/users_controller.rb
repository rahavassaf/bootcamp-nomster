class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@itisme = @user.id == current_user.id
	end
end
