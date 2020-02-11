class Challenge < ApplicationRecord
  has_many :favorites
  has_many :challenges, through: :favorites
  has_many :histories
  has_many :challenges, through: :histories
  has_many :participate_ins
  has_many :challenges, through: :participate_ins
  validates :name, :category, :description, :coins, :duration, :deadline, :presence => true
  validates :name, :uniqueness => { :case_sensitive => false }
end
