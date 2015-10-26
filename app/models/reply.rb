class Reply < ActiveRecord::Base
  belongs_to :replier, class_name: "User", foreign_key: "user_id"
  belongs_to :critique

  validates :user_id, presence: true
  validates :critique_id, presence: true
  validates :body, presence: true
end
