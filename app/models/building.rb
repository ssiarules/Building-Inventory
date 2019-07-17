class Building < ApplicationRecord
   has_many :products 
   has_many :users, through: :products

     accepts_nested_attributes_for :products
end
