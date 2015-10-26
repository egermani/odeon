class Topic < ActiveRecord::Base
  belongs_to :keypoint
  belongs_to :review

  validates :keypoint, presence: true
  validates :review, presence: true
end
