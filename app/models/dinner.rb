class Dinner < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :dinner_dishes
  has_many :dishes, through: :dinner_dishes
  accepts_nested_attributes_for :dishes, reject_if: proc { |attributes| attributes['name'].blank? }
  has_many :images, as: :imageable
  has_many :comments, as: :commentable
  default_scope { order(date: 'DESC') }


  def self.in_the_future
    Dinner.where("DATE >= ?", Date.today)
  end

  def self.in_the_past
    Dinner.where("DATE < ?", Date.today)
  end

  def dishes_attributes=(attributes)
    dishes = attributes.collect do |k,v|

      if v[:_destroy] == "false"
        binding.pry
        if v[:id]
          dish = Dish.find_by(id: v[:id])
        else
          dish = Dish.new(v) unless v.name =""
        end
        dish.try(:creators) == "" ? dish.creators = "Stuyvesant Supper Club" : dish.creators
        dish
      end
      binding.pry
    end
    self.dishes = dishes.flatten
  end

end
