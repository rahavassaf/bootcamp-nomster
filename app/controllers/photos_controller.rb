class PhotosController < ApplicationController
	before_action :authenticate_user!

	def create
		@place = Place.find(params[:place_id])
		@photo = @place.photos.create(photo_params.merge(user: current_user))

		if @photo.invalid?
			flash[:error] = "Could not save: #{@photo.errors.messages}"
			redirect_to request.referrer
		else
			flash[:success] = 'Saved Successfully'
			redirect_to place_path(@place)
		end
	end

	def destroy
		@photo = Photo.find(params[:id])

		if @photo.user != current_user
			return render plain: 'Not Allowed', status: :forbidden
		end

		@photo.destroy
		redirect_to request.referrer
	end

	private

	def photo_params
		params.require(:photo).permit(:caption, :picture)
	end
end
