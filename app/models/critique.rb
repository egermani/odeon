class Critique < ActiveRecord::Base
  belongs_to :critiquer, class_name: "User", foreign_key: "user_id"
  belongs_to :review
  has_many :replies
  belongs_to :keypoint

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :keypoint_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

end
