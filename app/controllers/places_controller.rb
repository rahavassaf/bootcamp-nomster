class PlacesController < ApplicationController
	def index
		@places = Place.paginate(page: params[:page], per_page: 10)
	end

	def new
		@place = Place.new
	end

	def create
		@place = Place.create(place_params)
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

	private

	def place_params
    	params.require(:place).permit(:name, :description, :address)
  	end
end
