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
			render :new, status: :unprocessable_entity
		else
			flash[:success] = 'Saved Successfully'
			redirect_to @place
		end
	end

	def show
		@place = Place.find(params[:id])
		@supress_self_link = true # avoid circular links in place_path
		@comments = Comment.where(:place_id => params[:id]) || []
		#TODO prevent users from submitting multiple comments for the same place
		@new_comment = Comment.new
	end

	def edit
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render plain: 'Not Allowed', status: :forbidden
		end
	end

	def update
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render plain: 'Not Allowed', status: :forbidden
		end

		@place.update(place_params)

    	if @place.invalid?
    		render :edit, status: :unprocessable_entity
		else
			flash[:success] = 'Updated Successfully'
			redirect_to request.referrer
		end
	end

	def destroy
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render plain: 'Not Allowed', status: :forbidden
		end

		@place.destroy

		# clean up orphaned comments
		Comment.where(:place_id => @place.id).destroy_all

		redirect_to root_path
	end

	private

	def place_params
    	params.require(:place).permit(:name, :description, :address)
  	end
end
