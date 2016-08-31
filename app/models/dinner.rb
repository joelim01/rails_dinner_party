class Dinner < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :dinner_dishes
  has_many :dishes, through: :dinner_dishes
  has_many :images, as: :imageable
  has_many :comments, as: :commentable


  def self.in_the_future
    Dinner.where("DATE >= ?", Date.today)
  end

  def self.in_the_past
    Dinner.where("DATE < ?", Date.today)
  end

end
