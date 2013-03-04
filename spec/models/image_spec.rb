require 'spec_helper'

describe Image do
  it "should store the images in destination dir" do
  	image = mock("Image", :original_filename=>"1.jpg", :read => "test data")
  	image = Image.create_from_params(image)
  	Image.first.name.should == "1.jpg"
  	File.should exist "/data/sweethome/#{image.id}.jpg"
  end
end
