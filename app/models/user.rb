class User < ApplicationRecord
  has_many :favorites
  has_many :challenges, through: :favorites
  has_many :histories
  has_many :challenges, through: :histories
  has_many :participate_ins
  has_many :challenges, through: :participate_ins

  before_save { email.downcase! }
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
