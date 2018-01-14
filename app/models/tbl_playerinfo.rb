class TblPlayerinfo < ApplicationRecord
  self.table_name = 'tbl_playerinfo'
  has_many :group_relationships, class_name: "GroupRelationship",
                                 foreign_key: "userid",
                                 dependent: :destroy
  has_many :groups, through: :group_relationships, source: :group_msg                                 
end
