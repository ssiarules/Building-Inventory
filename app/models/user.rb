class User < ApplicationRecord
  belongs_to :building
  has_many :products
  has_many :floors, through: :products 
  has_secure_password
  validates :username, :email, presence: true 
  validates :username, uniqueness: true
end
