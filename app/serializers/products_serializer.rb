class ProductsSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :description, :date_added
  belongs_to :user, serializer: ProductUserSerializer
  belongs_to :building, serializer: ProductBuildingSerializer
end

