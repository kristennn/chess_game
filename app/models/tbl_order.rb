class TblOrder < ApplicationRecord
  self.table_name = 'tbl_order'
  # belongs_to :tbl_account, :class_name => "TblAccount", :foreign_key => "userid"
end
