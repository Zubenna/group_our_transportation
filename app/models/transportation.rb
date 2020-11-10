class Transportation < ApplicationRecord
  # has_many :groups
  # belongs_to :group
  has_one_attached :image
  has_one :group
  belongs_to :user
  validates_presence_of :user_id, :distance
  validates :name, presence: true, length: { maximum: 40 }

  validates :image, content_type: {in: %w[image/jpeg image/gif image/png],
                                    message: 'must be a valid image format'},
                    size:         { less_than: 2.megabytes,
                                     message:  'should be less than 2MB'}
                                     
end
