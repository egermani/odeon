class Keypoint < ActiveRecord::Base
	has_many :topics
	has_many :critiques
end
