class User < ActiveRecord::Base
	has_many :reviews
	has_many :replies
	has_many :critiques
	has_many :votes

	has_secure_password
end
