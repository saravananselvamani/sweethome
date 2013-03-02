class Home < ActiveRecord::Base
	validates :amount, :address, :presence => true
	validate :check_phone_no_presence

	def image_path
		"/assets/rails.png"
	end
	private
	def check_phone_no_presence
		if home_phone.blank? && office_phone.blank?
			errors.add(:phone, "no cannot be blank") 
			return false
		end
		return true
	end
end
