class Reservation < ApplicationRecord
  delegate :date, :to => :dinner, :allow_nil => true
  belongs_to :user
  belongs_to :dinner
  validates :party_of, presence: true
end
