class Dish < ApplicationRecord
  has_many :dinner_dishes
  has_many :dinners, through: :dinner_dishes
  has_many :users, through: :dinners
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients
  has_many :images, as: :imageable
  has_many :comments, as: :commentable

end
