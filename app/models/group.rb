class Group < ApplicationRecord
  has_many :Transportations
  belongs_to :User
  validates_presence_of :user_id, :name, :icon,
  validates_length_of :name, :maximum => 50
end
