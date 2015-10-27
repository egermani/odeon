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


	def is_trusted?
		score > 2.7 && self.votes_for.count > 15
	end

	def score
		(vote_count(3) * 4.0 + vote_count(2) * 3.0 + vote_count(1) * 2.0 + vote_count(0) * 1.0)/self.votes_for.count
	end

	def vote_count(number)
		self.votes_for.where(sentiment: number).count
	end

	private

	def user_params
		params.require(:user).permit(:email, :username, :password)
	end

end
