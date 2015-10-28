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
		if reviews.length == 0
			"N/A"
		else
			reviews.map(&:rating).reduce(:+) / reviews.count
		end
	end

	def hot_score
		score = 100
		score -= ((Time.now - created_at)/3600)
		score += (reviews.count * 2.5)
		reviews.each do |review|
			score += (review.critiques.count * 0.25)
		end
		p score
	end

	def self.sort_by_hotness
		Movie.includes(reviews: [:critiques]).all.sort_by {|movie| movie.hot_score}
	end

end
