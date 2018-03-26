class TblPlayerinfo < ApplicationRecord
  mount_uploader :headimgxf, ImageUploader
  self.table_name = 'tbl_playerinfo'
  has_one :account, class_name: "TblAccount", foreign_key: "userid"
  #------------------------------------ 圈子模块 --------------------------------#
  has_many :group_relationships, class_name: "GroupRelationship",
                                 foreign_key: "userid",
                                 dependent: :destroy
  has_many :groups, through: :group_relationships, source: :group_msg

  has_many :group_msgs, class_name: "GroupMsg", foreign_key: "userid"
  has_many :quit_records, class_name: "QuitRecord", foreign_key: "userid"

    def is_player_of?(group_msg)
      groups.include?(group_msg)
    end

    def join!(group_msg)
      groups << group_msg
    end

    def quit!(group_msg)
      groups.delete(group_msg)
    end

  #-------------------------------------结束 -----------------------------------#

  #-------------------------------------好友模块---------------------------------#
  has_many :active_relationships,  class_name:   "PlayerRelationship",
                                   foreign_key:  "follower_id",
                                   dependent:    :destroy
  has_many :passive_relationships, class_name:   "PlayerRelationship",
                                   foreign_key:  "followed_id",
                                   dependent:    :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships,source: :follower

  has_many :friend_requests, class_name: "FriendRequest", foreign_key: "userid"

  def following?(other_user)
    following.include?(other_user)
  end

  def follow!(other_user)
    following << other_user
  end

  def unfollow!(other_user)
    following.delete(other_user)
  end
 #---------------------------------------结束-----------------------------------#

end
