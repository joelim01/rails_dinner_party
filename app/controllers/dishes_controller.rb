class DishesController < ApplicationController

  def index
    if current_user
      @user = current_user
      @dishes = @user.dishes
    else
      @dishes = Dish.all
    end
  end

end
