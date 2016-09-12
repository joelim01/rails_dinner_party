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
    # find all the dishes that are not marked for removal
    remaining_dishes = attributes.select do |k,v|
      v[:_destroy] == "false"
    end
    # collect the dishes
    dishes = remaining_dishes.collect do |k,hash_dish|
      # does the dish already have an ID (does it exist in the DB)?
      if hash_dish[:id] && !hash_dish[:id].blank?
        # if it exists and all attributes are blank, don't try to update the dish, otherwise update
        unless hash_dish[:name].blank? && hash_dish[:creators].blank? && hash_dish[:ingredients_attributes][:ingredients_string].blank?
          dish = Dish.find_by(id: hash_dish[:id])
          dish.name = hash_dish[:name]
          dish.creators = hash_dish[:creators]
        else
          dish = Dish.find_by(id: hash_dish[:id])
        end
      # if it doesn't exist, create it
      else
        dish = Dish.find_or_initialize_by(name: hash_dish[:name])
        dish.creators = hash_dish[:creators]
      end
      # if the dish creator field is blank, fill it in with a default value
      dish.creators == "" ? dish.creators = "Stuyvesant Supper Club" : dish.creators
      # if the dish_hash ingredients string is not empty or nil then format the sting,
      # split it, and save the individual ingredients to the db and assign them to the dish
      if hash_dish[:ingredients_attributes][:ingredients_string] != nil && hash_dish[:ingredients_attributes][:ingredients_string] != ""
        name_string = hash_dish[:ingredients_attributes][:ingredients_string].downcase
        items = name_string.split(',')
        ingredients = items.collect {|i| Ingredient.find_or_create_by(name: i.strip)}
        dish.ingredients = ingredients
      end
      # save the dish
      dish.save!
      dish

    end
    # delete the dinner's dishes and replace with collected updated dishes
    self.dishes.delete_all
    self.dishes << dishes

  end

end
