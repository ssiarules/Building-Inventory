class ProductsSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :description, :date_added
end

