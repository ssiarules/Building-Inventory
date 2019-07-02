class Building < ApplicationRecord
    has_many :products
    has_many :users 
    has_many :products through: :floors 

end
