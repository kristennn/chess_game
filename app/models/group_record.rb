class GroupRecord < ApplicationRecord
  belongs_to :group_msg
  belongs_to :tbl_playerinfo, class_name: "TblPlayerinfo", foreign_key: "userid"
end
