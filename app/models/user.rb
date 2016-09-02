class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :reservations
  has_many :dinners, through: :reservations
  has_many :dishes, through: :dinners

def dishes
  users_past_dishes = self.dinners.in_the_past.collect {|dinner| dinner.dishes}
  users_past_dishes.flatten.uniq
end

def reservation_for(dinner)
  self.reservations.find_by(dinner_id: dinner.id)
end

def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
  data = access_token.info
  user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(email: data["email"],
          provider:access_token.provider,
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end
end
