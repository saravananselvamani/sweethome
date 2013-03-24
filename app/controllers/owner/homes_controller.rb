class Owner::HomesController < ApplicationController
  protect_from_forgery

  def new
  end

  def search

  end

  def create
    @home = Home.new(filtered_params.merge!(:person_id => 1))
    @home.save
    update_images
    redirect_to owner_homes_path
  end

  def index
    @homes = Home.where(:person_id => 1)
  end

  def edit
    @home = Home.find(params[:id])
    render :new
  end

  def update
    @home = Home.find(params[:id])
    @home.update(filtered_params)
    update_images
    redirect_to owner_homes_path
  end

  private
  def filtered_params
    params[:home].permit(:name, :rent_or_sale, :address, :home_phone, :office_phone, :amount, :image_ids, :lat, :lng)
  end

  def update_images
    images = Image.where(id:params[:home][:image_ids])
    images.each {|image| @home.images << image}
  end
end
