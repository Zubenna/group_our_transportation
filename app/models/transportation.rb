class Transportation < ApplicationRecord
  has_many :Groups
  belongs_to :User
  validates_presence_of :user_id, :name, :distance,
  validates_length_of :name, :maximum => 50
end
