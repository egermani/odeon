class Movie < ActiveRecord::Base
	has_many :reviews

	validates :title, presence: true, uniqueness: true
	validates :synopsis, presence: true
	validates :release_date, presence: true
	validates :director, presence: true

end
