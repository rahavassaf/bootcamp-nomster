class CommentsController < ApplicationController
	before_action :authenticate_user!


	def create
		@place = Place.find(params[:place_id])
		@comment = @place.comments.create(comment_params.merge(user: current_user))

		if @comment.invalid?
			flash[:error] = "Could not save: #{@comment.errors.messages}"
			redirect_to request.referrer
		else
			flash[:success] = 'Saved Successfully'
			redirect_to place_path(@place)
		end
	end

	def destroy
		@comment = Comment.find(params[:id])

		if @comment.user != current_user
			return render plain: 'Not Allowed', status: :forbidden
		end

		@comment.destroy
		redirect_to request.referrer
	end

	#TODO
	def edit
	end

	#TODO
	def update
	end

	private

	def comment_params
		params.require(:comment).permit(:message, :rating)
	end
end
