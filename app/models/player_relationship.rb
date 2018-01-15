class PlayerRelationship < ApplicationRecord
  validates_presence_of :follower_id, :followed_id
  belongs_to :follower, class_name: "TblPlayerinfo"
  belongs_to :followed, class_name: "TblPlayerinfo"
end
