class User < ApplicationRecord
  has_many :created_products, foreign_key: "user_id", class_name: "Product"
  has_many :products 
  has_many :buildings, through: :products
  has_secure_password
  validates :username, :email, presence: true
  validates :username, uniqueness: true


 # def self.create_with_omniauth(auth)
   # create! do |user|
     # user.provider = auth["provider"]
     # user.uid = auth["uid"]
     # user.name = auth["info"]["username"]
    #end
  #end
end
