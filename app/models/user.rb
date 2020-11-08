class User < ApplicationRecord
  has_many :Transportations
  has_many :Groups
  validates_presence_of :first_name, :last_name, :username, :email
  validates_length_of :username, :within => 6..12
  validates_uniqueness_of :username, :email
end