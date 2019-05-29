class PlacesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update]

	def index
		@places = Place.paginate(page: params[:page], per_page: 10)
	end

	def new
		@place = Place.new
	end

	def create
		@place = current_user.places.create(place_params)

		if @place.invalid?
			flash[:error] = 'Could not save: the data you entered is invalid.'
			redirect_to request.referrer
		else
			flash[:success] = 'Saved Successfully'
			redirect_to @place
		end
	end

	def show
		@place = Place.find(params[:id])
		@supress_self_link = true # avoid circular links in place_path
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])
		@place.update(place_params)

    	if @place.invalid?
			flash[:error] = 'Could not save: the data you entered is invalid.'
			redirect_to request.referrer
		else
			flash[:success] = 'Updated Successfully'
			redirect_to @place
		end
	end

	def destroy
		Place.find(params[:id]).destroy
		redirect_to root_path
	end

	private

	def place_params
    	params.require(:place).permit(:name, :description, :address)
  	end
end
