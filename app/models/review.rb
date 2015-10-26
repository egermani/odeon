class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: "User"
  belongs_to :movie
  has_many :topics
  has_many :critiques
  has_many :keypoints, through: :topics
end
