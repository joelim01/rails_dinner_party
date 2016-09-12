module DinnersHelper

  def reserve_or_sign_up(dinner)
    if user_signed_in? && dinner.users.include?(current_user)
      link_to "Edit your reservation", user_reservations_path(current_user)
    elsif user_signed_in? && dinner.users.include?(current_user)
      link_to "Reserve", new_dinner_reservation_path(dinner)
    else
      link_to "Sign up to reserve", new_user_registration_path
    end
  end

  def display_datetime(datetime)
    datetime.strftime("%A, %B %d, %Y at %H:%M%p")
  end

  def announce_chefs(dinners)
    if !dinners.chefs.blank?
     "Your #{"chef".pluralize(dinners.chefs.split(",").count)} will be: #{dinners.chefs}."
    else
     "Chefs will be announced soon."
    end
  end

end
