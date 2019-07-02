class Floor < ApplicationRecord
  belongs_to :building
  has_many :products 
  has_many :users,  through: :products 

end
