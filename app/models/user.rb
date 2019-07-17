class User < ApplicationRecord
  has_many :products 
  has_many :buildings, through: :products
  has_secure_password
  validates :username, :email, presence: true 
  validates :username, uniqueness: true
end
