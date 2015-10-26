class Topic < ActiveRecord::Base
  belongs_to :keypoint
  belongs_to :review
end
