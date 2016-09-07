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

  def display_simpledatetime
    self.date.strftime("%B %d, %Y at %H:%M%p")
  end

  def dishes_attributes=(attributes)

    remaining_dishes = attributes.select do |k,v|
      v[:_destroy] == "false"
    end

    dishes = remaining_dishes.collect do |k,hash_dish|
      if hash_dish[:id] && !hash_dish[:id].blank?
        unless hash_dish[:name].blank? && hash_dish[:creators].blank? && hash_dish[:ingredients_attributes][:ingredients_string].blank?
          dish = Dish.find_by(id: hash_dish[:id])
          dish.name = hash_dish[:name]
          dish.creators = hash_dish[:creators]
        else
            binding.pry
          dish = Dish.find_by(id: hash_dish[:id])
        end
      else
        dish = Dish.find_or_initialize_by(name: hash_dish[:name])
        dish.creators = hash_dish[:creators]
      end
      dish.creators == "" ? dish.creators = "Stuyvesant Supper Club" : dish.creators

      if hash_dish[:ingredients_attributes][:ingredients_string] != nil && hash_dish[:ingredients_attributes][:ingredients_string] != ""
        name_string = hash_dish[:ingredients_attributes][:ingredients_string].downcase
        items = name_string.split(',')
        ingredients = items.collect {|i| Ingredient.find_or_create_by(name: i.strip)}
        dish.ingredients = ingredients
      end

      dish.save!
      dish

    end

    self.dishes.delete_all
    self.dishes << dishes

  end

end
