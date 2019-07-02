class User < ApplicationRecord
  belongs_to :building
  has_many :products
  has_many :floors, through: :products 
end
