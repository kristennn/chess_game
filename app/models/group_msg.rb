class GroupMsg < ApplicationRecord
  validates_presence_of :name
  has_many :group_relationships
  has_many :players, through: :group_relationships, source: :tbl_playerinfo
end
