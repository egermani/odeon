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
			@reviews += self.reviews.select do |review| review.topics.select{|topic| topic.keypoint_id == 1}
			end
		end
		if args[:cinema]
			@reviews += self.reviews.select do |review| review.topics.select{|topic| topic.keypoint_id == 2}
			end
		end
		if args[:score]
			@reviews += self.reviews.select do |review| review.topics.select{|topic| topic.keypoint_id == 3}
			end
		end
		if args[:writing]
			@reviews += self.reviews.select do |review| review.topics.select{|topic| topic.keypoint_id == 4}
			end
		end
		if args[:sfx]
			@reviews += self.reviews.select do |review| review.topics.select{|topic| topic.keypoint_id == 5}
			end
		end
		p @reviews.class
		return @reviews
	end

	def composite_score
		if reviews.length == 0
			"??"
		else
			reviews.map(&:rating).reduce(:+) / reviews.count
		end
	end

end
