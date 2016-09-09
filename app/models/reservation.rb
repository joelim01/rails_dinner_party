class Reservation < ApplicationRecord
  delegate :date, :to => :dinner, :allow_nil => true
  belongs_to :user
  belongs_to :dinner
  accepts_nested_attributes_for :dinner


end
