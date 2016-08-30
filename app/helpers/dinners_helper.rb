module DinnersHelper

  def reserve_or_sign_up(dinner)
    if user_signed_in?
      link_to "Reserve", new_dinner_reservation_path(dinner)
    else
      link_to "Sign up to reserve.", new_users_path
    end
  end

end
