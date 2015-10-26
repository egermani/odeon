class Keypoint < ActiveRecord::Base
	has_many :topics
	has_many :critiques

	validates :image_path, presence: true
	validates :name, presence: true

end
