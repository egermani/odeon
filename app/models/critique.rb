class Critique < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  has_many :replies
  has_one :keypoint
end
