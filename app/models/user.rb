class User < ActiveRecord::Base
	has_many :task
	has_many :sprint

	 def self.validate_user(name, password)
		user = User.find_by_name(name)
		if user and user.password == password
			user
		else
			nil
		end
  end
  
end
