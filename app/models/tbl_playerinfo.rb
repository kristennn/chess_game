class TblPlayerinfo < ApplicationRecord
  self.table_name = 'tbl_playerinfo'
  has_many :group_relationships, class_name: "GroupRelationship",
                                 foreign_key: "userid",
                                 dependent: :destroy
  has_many :groups, through: :group_relationships, source: :group_msg


  def is_player_of?(group_msg)
    groups.include?(group_msg)
  end

  def join!(group_msg)
    groups << group_msg
  end

  def quit!(group_msg)
    groups.delete(group_msg)
  end

end
