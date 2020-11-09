class Group < ApplicationRecord
  has_many :transportations
  belongs_to :user
  validates_presence_of :user_id, :name, :icon,
  validates_length_of :name, :maximum => 50
end
