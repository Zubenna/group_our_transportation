class Transportation < ApplicationRecord
  # has_many :groups
  belongs_to :group, optional: true
  # has_one_attached :image
  # has_one :group
  belongs_to :user
  validates_presence_of :distance
  validates :name, presence: true, length: { maximum: 40 }
end
