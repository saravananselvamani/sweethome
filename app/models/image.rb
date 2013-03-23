class Image < ActiveRecord::Base
  belongs_to :owner
	def self.create_from_params(image)
		file_name = image.original_filename
		img = Image.create({:name => file_name})
		destination_dir = Rails.configuration.image_dir
		path = File.join(destination_dir, "#{img.id}.jpg")
		File.open(path, "wb") { |f| f.write(image.read)}
		img
	end
end
