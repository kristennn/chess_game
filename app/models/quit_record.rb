class QuitRecord < ApplicationRecord
  belongs_to :tbl_playerinfo, :class_name => "TblPlayerinfo", :foreign_key => "userid"
end
