class Admin::DishesController < ApplicationController
  before_filter :admin_only

  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    if @dish = Dish.create(dishes_params)
      redirect_to admin_dishes_path, :flash => { :message => "Dish created." }
    else
      render :create
    end
  end


  def destroy
    Dish.find_by(id: params[:id]).destroy
    redirect_to admin_dishes_path, :flash => { :message => "Dish deleted." }
  end

  def update
    @dishes = Dish.all
    @dish = Dish.find(params[:id])
    if @dish.update(dishes_params)
      redirect_to admin_dishes_path, :flash => { :message => "Dish updated." }
    else
      render "admin/dishes/index"
    end
  end

  def dishes_params
    params.require(:dish).permit(:name, :creators, ingredients_attributes: [:ingredients_string], dinner_ids:[])
  end

end
