class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_many :topics
  has_many :keypoints, through: :topics
end
