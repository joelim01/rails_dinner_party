class DinnersController < ApplicationController

  def index
    @dinners = Dinner.in_the_future
  end

  def show
    @dinner = Dinner.find_by(id: params[:id])
  end

end
