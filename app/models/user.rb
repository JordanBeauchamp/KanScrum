class User < ActiveRecord::Base
	
	has_many :tasks
	has_and_belongs_to_many :teams

	def self.validate_user(name, password)
		user = User.find_by_name(name)
		if user and user.password == password
			user
		else
			nil
		end
	end
  
end
