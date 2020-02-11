class User < ApplicationRecord
  has_many :favorites
  has_many :challenges, through: :favorites
  has_many :histories
  has_many :challenges, through: :histories
  has_many :participate_ins
  has_many :challenges, through: :participate_ins
  # validates :name, :email, :password, :presence => true
  # validates :name, :uniqueness => { :case_sensitive => false }
  # validates :email, :uniqueness => { :case_sensitive => false }
# endclass User < ApplicationRecord
end
