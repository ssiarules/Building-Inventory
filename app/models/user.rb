class User < ApplicationRecord
  has_many :created_products, foreign_key: "user_id", class_name: "Product"
  has_many :products 
  has_many :buildings, through: :products
  has_secure_password #created from user table / column password_digest. Password_digest avoids passwords from being stolen by encrypting before stored in the database.
  validates :username, :email, presence: true
  validates :username, uniqueness: true #validates that only one user


 # def self.create_with_omniauth(auth)
   # create! do |user|
     # user.provider = auth["provider"]
     # user.uid = auth["uid"]
     # user.name = auth["info"]["username"]
    #end
  #end
end
