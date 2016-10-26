class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates :content, presence: true
  validates :content, length: {minimum: 5,
    too_short: "has a minimum character count of 5 characters."}

end
