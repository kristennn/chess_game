class Callboard < ApplicationRecord
  validates_presence_of :title, :post
  # 
  # before_validation :generate_friendly_id, :on => :create
  #
  # def to_param
  #   self.id
  # end
  #
  # protected
  #
  #  def generate_friendly_id
  #    self.friendly_id ||= SecureRandom.uuid
  #  end
end
