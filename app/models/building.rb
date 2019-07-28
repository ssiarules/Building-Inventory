class Building < ApplicationRecord
   has_many :products 
   has_many :users, through: :products

   validates :name, presence: true
   validates :name, uniqueness: true
   accepts_nested_attributes_for :products
end
