class GroupMsg < ApplicationRecord
  has_many :group_relationships
  has_many :players, through: :group_relationships, source: :tbl_playerinfo
end
