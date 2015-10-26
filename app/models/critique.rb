class Critique < ActiveRecord::Base
  belongs_to :critiquer, class_name: "User"
  belongs_to :review
  has_many :replies
  has_one :keypoint
end
