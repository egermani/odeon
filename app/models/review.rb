class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_many :topics
  has_many :critiques
  has_many :keypoints, through: :topics
  has_many :votes

  validates :user_id, presence: true
  validates :movie_id, presence: true
  validates :body, presence: true
  validates :thesis, presence: true
  validates :title, presence: true
  validates :rating, presence: true

end
