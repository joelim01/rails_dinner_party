class DinnerSerializer < ActiveModel::Serializer
  attributes :id, :date, :chefs
  has_many :dishes
end
