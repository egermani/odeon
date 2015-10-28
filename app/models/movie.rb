class Movie < ActiveRecord::Base
	attr_accessor :acting, :cinema, :score, :writing, :sfx
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

	def sort_state(args = {})
		@reviews = self.reviews.where(:id => nil).where("id IS NOT ?", nil)
		if args[:acting]
			@reviews += self.reviews.select do |review| review.keypoints.include?(Keypoint.first)
			end
		end
		if args[:cinema]
			@reviews += self.reviews.select do |review| review.keypoints.include?(Keypoint.find(2))
			end
		end
		if args[:score]
			@reviews += self.reviews.select do |review| review.keypoints.include?(Keypoint.find(3))
			end
		end
		if args[:writing]
			@reviews += self.reviews.select do |review| review.keypoints.include?(Keypoint.find(4))
			end
		end
		if args[:sfx]
			@reviews += self.reviews.select do |review| review.keypoints.include?(Keypoint.find(5))
			end
		end

		@reviews = @reviews.uniq
		return @reviews.sort_by{|review| review.score * -1}
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
		score
	end

	def self.sort_by_hotness
		Movie.includes(reviews: [:critiques]).all.sort_by {|movie| movie.hot_score}
	end

end
