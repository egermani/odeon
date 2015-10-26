class Reply < ActiveRecord::Base
  belongs_to :replier, class_name: "User", foreign_key: "user_id"
  belongs_to :critique
end
