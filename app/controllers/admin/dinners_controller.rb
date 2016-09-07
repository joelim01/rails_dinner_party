class Admin::DinnersController < ApplicationController
  before_filter :admin_only

  def index
    @dinners = Dinner.all
  end

  def edit
    @dinner = Dinner.find_by(id: params[:id])
    @dishes = @dinner.dishes.empty? ? @dinner.dishes.build : @dinner.dishes
  end

  def update
    @dinner = Dinner.find_by(id: params[:id])
    if @dinner.update(date: params[:dinner][:date], chefs: params[:dinner][:chefs])
      @dinner.update(dishes_attributes: params[:dinner][:dishes_attributes])
      redirect_to edit_admin_dinner_path(@dinner), :flash => { :message => "Dinner updated." }
    else
      render :edit
    end
    rescue ActiveRecord::RecordInvalid => invalid
       redirect_to edit_admin_dinner_path(@dinner), :flash => { :error => "#{invalid.record.class.name}: #{invalid.record.errors.full_messages.join " ,"}." }
  end

  def dinner_params
    params.require(:dinner).permit(:date, :chefs, :dish_dropdown_id,
              dishes_attributes: [:id, :name, :creators, :_destroy,
                ingredients_attributes: [:ingredients_string]])
  end

end
