class User < ApplicationRecord
  has_many :created_products, foreign_key: "user_id", class_name: "Product"
  has_many :products 
  has_many :buildings, through: :products
  has_secure_password
  validates :username, :email, presence: true 
  validates :username, uniqueness: true
end
