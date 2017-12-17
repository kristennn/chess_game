class TblAccount < ApplicationRecord
  self.table_name = 'tbl_account'
  belongs_to :user, :class_name => "User", :foreign_key => "saler"
end
