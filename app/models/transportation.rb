class Transportation < ApplicationRecord
  has_many :groups
  belongs_to :user
  # mount_uploader :picture, PictureUploader
  validates_presence_of :user_id, :distance
  validates :name, presence: true, length: { maximum: 40 }
end
