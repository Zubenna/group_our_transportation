class User < ApplicationRecord
  has_many :transportations, foreign_key: :author_id, dependent: :destroy
  has_many :groups, foreign_key: :author_id
  has_one_attached :picture
  validates_presence_of :first_name, :last_name, :username, :email
  validates_length_of :username, within: 6..12
  validates_uniqueness_of :username, :email
end
