class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :transportations_groups
  has_many :transportations, through: :transportations_groups, dependent: :destroy

  has_one_attached :icon
  validates_presence_of :author_id, :icon
  validates :name, presence: true, length: { maximum: 40 }
  validates :icon, content_type: { in: %w[image/jpeg image/gif image/png],
                                   message: 'must be a valid image format' },
                   size: { less_than: 2.megabytes,
                           message: 'should be less than 2MB' }
  scope :order_group, -> { order('name') }
  scope :asc, -> { order('name ASC') }
end
