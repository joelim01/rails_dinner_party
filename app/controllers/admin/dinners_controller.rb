class Admin::DinnersController < ApplicationController
  before_filter :admin_only

  def index
    @dinners = Dinner.all
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @dinners, include: 'dishes.ingredients' }
    end
  end

  def edit
    @dinner = Dinner.find_by(id: params[:id])
    @dishes = @dinner.dishes.empty? ? @dinner.dishes.build : @dinner.dishes
  end

  def update
    @dinner = Dinner.find_by(id: params[:id])
    if @dinner.update(dinner_params)
      redirect_to edit_admin_dinner_path(@dinner), :flash => { :message => "Dinner updated." }
    else
      render :edit
    end
    rescue ActiveRecord::RecordInvalid => invalid
       redirect_to edit_admin_dinner_path(@dinner), :flash => { :error => "#{invalid.record.class.name}: #{invalid.record.errors.full_messages.join " ,"}." }
  end

  def new
    @dinner = Dinner.new
  end

  def create
    @dinner = Dinner.new(dinner_params)
    if @dinner.save
      redirect_to edit_admin_dinner_path(@dinner), :flash => { :message => "Dinner created." }
    else
      render :new
    end
    rescue ActiveRecord::RecordInvalid => invalid
       redirect_to new_admin_dinner_path, :flash => { :error => "#{invalid.record.class.name}: #{invalid.record.errors.full_messages.join " ,"}." }
  end

private

  def dinner_params
    params.require(:dinner).permit(:date, :chefs,
              dishes_attributes: [:id, :name, :creators, :_destroy,
                ingredients_attributes: [:ingredients_string]])
  end

end
