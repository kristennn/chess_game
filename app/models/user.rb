class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


  has_many :tbl_accounts, :class_name => "TblAccount", :foreign_key => "saler"
  class << self

    # 返回指定字符串的哈希摘要
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end


    #返回一个随机令牌（用于remember_token）
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  #为了持久保持会话，在数据库中记住用户
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #如果指定的令牌和摘要匹配，返回true
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #忘记用户
  def forget
    update_attribute(:remember_digest, nil)
  end

  def total_diamond
    u = self.diamond.to_i
    self.diamond = u + self.count.to_i
  end

end
