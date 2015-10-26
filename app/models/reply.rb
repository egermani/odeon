class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :critique

  validates :user_id, presence: true
  validates :critique_id, presence: true
  validates :text, presence: true
end
