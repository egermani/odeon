class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: "User", foreign_key: "user_id"
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

  def score
    score = 0
    self.votes.each do |vote|
      score += vote.sentiment
    end

    score += 40 if self.reviewer.trusted == true
    score
  end

end
