class HomesController < ApplicationController
    protect_from_forgery
	def new 
	end

	def create
		Home.new(filtered_params.merge!(:person_id => 1)).save!
		redirect_to homes_path
	end

	def index
		@homes = Home.where(:person_id => 1)
	end

    def edit
      @home = Home.find(params[:id])
      render :new
    end

    def update
      Home.find(params[:id]).update(filtered_params)
      redirect_to homes_path
    end

	private
	def filtered_params
		params[:home].permit(:name, :rent_or_sale, :address, :home_phone, :office_phone, :amount)
	end
end
