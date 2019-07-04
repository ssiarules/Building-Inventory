class Building < ApplicationRecord
    has_many :products
   belongs_to :users 
   has_many :products, through: :floors 

end
