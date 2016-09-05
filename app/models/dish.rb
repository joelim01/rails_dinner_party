class Dish < ApplicationRecord
  has_many :dinner_dishes
  has_many :dinners, through: :dinner_dishes
  has_many :users, through: :dinners
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients
  has_many :images, as: :imageable
  has_many :comments, as: :commentable
  validates :name, presence: true, allow_blank: false

  def ingredients_string
    array = self.ingredients.collect {|i| i.name}
    string = array.join(", ")
    string.titlecase
  end

end
