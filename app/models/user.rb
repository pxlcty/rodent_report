class User < ActiveRecord::Base
	#  gems
	has_secure_password

	#callbacks
	before_create { generate_token(:auth_token ) }

	#methods
	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end
	end


end
