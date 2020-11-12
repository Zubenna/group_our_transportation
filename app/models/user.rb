class User < ApplicationRecord
  has_many :transportations
  has_many :groups
  has_one_attached :picture
  validates_presence_of :first_name, :last_name, :username, :email
  validates_length_of :username, within: 6..12
  validates_uniqueness_of :username, :email
end
