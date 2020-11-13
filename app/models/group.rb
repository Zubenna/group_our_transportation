class Group < ApplicationRecord
  has_many :transportations
  belongs_to :user
  has_one_attached :icon
  validates_presence_of :user_id, :icon
  validates :name, presence: true, length: { maximum: 40 }
  validates :icon, content_type: { in: %w[image/jpeg image/gif image/png],
                                   message: 'must be a valid image format' },
                   size: { less_than: 2.megabytes,
                           message: 'should be less than 2MB' }
end
