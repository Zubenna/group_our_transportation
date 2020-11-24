class Transportation < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :transportations_groups
  has_many :groups, through: :transportations_groups, dependent: :destroy
  validates_presence_of :distance
  validates :name, presence: true, length: { maximum: 40 }
  scope :transportation_list, -> { order(created_at: :desc) }
  scope :desc, -> { includes(:author).order('created_at DESC') }
end
