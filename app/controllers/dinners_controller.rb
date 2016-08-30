class DinnersController < ApplicationController

  def show
    @dinners = Dinner.in_the_future
  end

end
