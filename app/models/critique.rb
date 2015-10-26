class Critique < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  has_many :replies
  has_one :keypoint

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :keypoint, presence: true
  validates :title, presence: true
  validates :body, presence: true

end
