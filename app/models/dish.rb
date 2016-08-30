class Dish < ApplicationRecord
  has_many :dinner_dishes
  has_many :dinners, through: :dinner_dishes
  has_many :images, as: :imageable
end
