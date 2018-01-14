class GroupRelationship < ApplicationRecord
  belongs_to :tbl_playerinfo, class_name: "TblPlayerinfo", foreign_key: "userid"
  belongs_to :group_msg
end
