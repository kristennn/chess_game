class GroupMsg < ApplicationRecord
  mount_uploader :pics, ImageUploader
  mount_uploader :pics2, ImageUploader
  mount_uploader :pics3, ImageUploader
  validates_presence_of :name
  belongs_to :player, class_name: "TblPlayerinfo", foreign_key: "userid"
  has_many :group_relationships, dependent: :destroy
  has_many :players, through: :group_relationships, source: :tbl_playerinfo

  has_many :group_records
end
