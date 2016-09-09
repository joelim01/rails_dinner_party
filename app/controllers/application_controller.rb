class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


private
  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

end
