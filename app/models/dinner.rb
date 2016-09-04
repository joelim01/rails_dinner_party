class Dinner < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :dinner_dishes
  has_many :dishes, through: :dinner_dishes
  accepts_nested_attributes_for :dishes
  has_many :images, as: :imageable
  has_many :comments, as: :commentable
  validates_associated :dishes
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
      if v[:id]
        dish = Dish.find_by(id: v[:id])
      else
        dish = Dish.new(name: v[:name], creators: v[:creators])
      end
      dish.creators == "" ? dish.creators = "Stuyvesant Supper Club" : dish.creators
      dish
      end

      self.dishes = dishes
    end

end
