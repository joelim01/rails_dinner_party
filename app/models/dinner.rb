class Dinner < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :dinner_dishes
  has_many :dishes, through: :dinner_dishes
  accepts_nested_attributes_for :dishes
  has_many :images, as: :imageable
  has_many :comments, as: :commentable
  validates :date, presence: true, allow_blank: false, allow_nil: false
  validates_associated :dishes, :message => "name can't be blank"
  default_scope { order(date: 'DESC') }


  def self.in_the_future
    Dinner.where("DATE >= ?", Date.today)
  end

  def self.in_the_past
    Dinner.where("DATE < ?", Date.today)
  end

  def dishes_attributes=(attributes)

    remaining_dishes = attributes.select do |k,v|
      v[:_destroy] == "false"
    end

    dishes = remaining_dishes.collect do |k,v|
      if v[:id] && !v[:id].blank?
        dish = Dish.find_by(id: v[:id])
      else
        dish = Dish.find_or_initialize_by(name: v[:name])
        dish.creators = v[:creators]
      end
      dish.creators == "" ? dish.creators = "Stuyvesant Supper Club" : dish.creators

      if v[:ingredients][:ingredients_string] != nil && v[:ingredients][:ingredients_string] != ""
        name_string = v[:ingredients][:ingredients_string].downcase
        items = name_string.split(',')
        ingredients = items.collect {|i| Ingredient.find_or_create_by(name: i.strip)}
        dish.ingredients = ingredients
        self.dishes << dish unless self.dishes.include?(dish)
      end

      dish.save!

    end

  end

end
