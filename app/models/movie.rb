class Movie < ActiveRecord::Base
	has_many :reviews
  has_many :movie_genres
  has_many :genres, through: :movie_genres
	
	validates :title, presence: true, uniqueness: true
	validates :synopsis, presence: true
	validates :release_date, presence: true
	validates :director, presence: true

	def self.sort
		Movie.all.sort_by {|movie| movie.reviews.count * -1}
	end

	def composite_score
		reviews.map(&:rating).reduce(:+) / reviews.count
	end

end
