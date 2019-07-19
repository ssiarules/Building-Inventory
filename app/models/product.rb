class Product < ApplicationRecord
  belongs_to :user
  belongs_to :building
  accepts_nested_attributes_for :building,
  reject_if: lambda {|attributes| attributes["name"].blank?}
end
