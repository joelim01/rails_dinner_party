class Dinner < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :images, as: :imageable


  def self.in_the_future
    Dinner.where("DATE >= ?", Date.today)
  end

end
