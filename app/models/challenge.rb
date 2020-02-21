class Challenge < ApplicationRecord
  has_many :participate_ins
  has_many :users, through: :participate_ins
  has_many :favorites
  has_many :fav_users, through: :favorites, source: :users
  has_many :histories
  has_many :his_users, through: :histories, source: :users

  validates :name, :category, :description, :coins, :duration, :deadline, :presence => true
  validates :name, :uniqueness => { :case_sensitive => false }
end
