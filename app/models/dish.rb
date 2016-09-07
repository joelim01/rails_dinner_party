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

  def ingredients_attributes=(attributes)
    if attributes[:ingredients_string] != nil && attributes[:ingredients_string] != ""
      name_string = attributes[:ingredients_string].downcase
      items = name_string.split(',')
      ingredients = items.collect {|i| Ingredient.find_or_create_by(name: i.strip)}
      self.ingredients = ingredients
      binding.pry
      self.save!
    end
  end

  # def dishes_attributes=(attributes)
  #
  #   remaining_dishes = attributes.select do |k,v|
  #     v[:_destroy] == "false"
  #   end
  #
  #   dishes = remaining_dishes.collect do |k,v|
  #     if v[:id] && !v[:id].blank?
  #       dish = Dish.find_by(id: v[:id])
  #     else
  #       dish = Dish.find_or_initialize_by(name: v[:name])
  #       dish.creators = v[:creators]
  #     end
  #     dish.creators == "" ? dish.creators = "Stuyvesant Supper Club" : dish.creators
  #
  #     if v[:ingredients][:ingredients_string] != nil && v[:ingredients][:ingredients_string] != ""
  #       name_string = v[:ingredients][:ingredients_string].downcase
  #       items = name_string.split(',')
  #       ingredients = items.collect {|i| Ingredient.find_or_create_by(name: i.strip)}
  #       dish.ingredients = ingredients
  #       self.dishes << dish unless self.dishes.include?(dish)
  #     end
  #
  #     dish.save!
  #
  #   end

end
