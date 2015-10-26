class User < ActiveRecord::Base
	has_many :reviews
	has_many :replies
	has_many :critiques
	has_many :votes
	has_many :votes_for, through: :reviews, source: :votes

	has_secure_password
	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true
end
