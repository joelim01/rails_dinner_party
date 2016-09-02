class DishesController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      if @user
        @dishes = @user.dishes
      else
        redirect_to dinners_path(current_user), :flash => { :error => "The waiter could not find your dishes. Please try again." }
      end
    else
      @dishes = Dish.all
    end
  end

end
