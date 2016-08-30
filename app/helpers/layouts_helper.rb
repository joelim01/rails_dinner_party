module LayoutsHelper
  def contextual_navigation
    if !user_signed_in?
      render 'layouts/guest_navigation'
    elsif user_signed_in? && !current_user.admin?
      render 'layouts/user_navigation'
    elsif user_signed_in? && current_user.admin?
      render 'layouts/admin_navigation'
    else
      render 'layouts/guest_navigation'
    end
  end
end
