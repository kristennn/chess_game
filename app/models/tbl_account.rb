class TblAccount < ApplicationRecord
  self.table_name = 'tbl_account'
  belongs_to :player, class_name: "TblPlayerinfo", foreign_key: "userid"
  belongs_to :user, :class_name => "User", :foreign_key => "saler"
  # has_many :tbl_orders, :class_name => "TblOrder", :foreign_key => "userid"
end
