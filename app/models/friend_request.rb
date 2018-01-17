class FriendRequest < ApplicationRecord
  belongs_to :gamer, class_name: "TblPlayerinfo", foreign_key: "userid"
end
