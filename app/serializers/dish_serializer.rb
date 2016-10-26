class DishSerializer < ActiveModel::Serializer
  attributes :name, :creators
  has_many :ingredients
end
