class User < ApplicationRecord
  has_many :transportations
  has_many :groups
  validates_presence_of :first_name, :last_name, :username, :email
  validates_length_of :username, within: '6..12'
  validates_uniqueness_of :username, :email
end
