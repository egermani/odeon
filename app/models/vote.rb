class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User", foreign_key: "user_id"
  belongs_to :review

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :sentiment, presence: true
  validates_uniqueness_of :user_id, :scope => :review_id

end
