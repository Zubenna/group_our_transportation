class Transportation < ApplicationRecord
  belongs_to :group, optional: true
  # has_and_belongs_to_many :groups
  belongs_to :user
  validates_presence_of :distance
  validates :name, presence: true, length: { maximum: 40 }
  scope :transportation_list, -> { order(created_at: :desc) }
end
