class ImagesController < ApplicationController
	def create
		image = Image.create_from_params(params[:images].first)
		render :json => {:image_id => image.id}, :status => 200
	end

	def get
		file = File.open(path_for_file(params[:image_id]), "r")
		send_data(file.read, :type => "image/jpeg", :disposition => :inline, :status => 200)
	end

	private
	def path_for_file(file)
		"/data/sweethome/#{file}.jpg"
	end
end
