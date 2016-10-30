class DinnersController < ApplicationController

  def index
    @dinners = Dinner.in_the_future
  end

  def show
    @dinner = Dinner.find_by(id: params[:id])
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @dinner, include: 'dishes.ingredients' }
    end
  end

end
