class Transportation < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user
  validates_presence_of :distance
  # validates_presence_of :creator
  validates :name, presence: true, length: { maximum: 40 }
end
