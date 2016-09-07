class Admin::DishesController < ApplicationController
  before_filter :admin_only

  def index
    @dishes = Dish.all
  end

  def destroy
    Dish.find_by(id: params[:id]).destroy
    redirect_to admin_dishes_path, :flash => { :message => "Dish deleted." }
  end

  def update
    @dish = Dish.find(params[:id])
    @dish.update(dishes_params)
    redirect_to admin_dishes_path, :flash => { :message => "Dish updated." }
  end

  def dishes_params
    params.require(:dish).permit(:name, :creators, ingredients_attributes: [:ingredients_string], dinner_ids:[])
  end

end


# {"utf8"=>"✓", "_method"=>"patch",
#   "dish"=>{"name"=>"Poached Oyster", "creators"=>"Stuyvesant Supper Club",
#     "ingredients"=>{"ingredients_string"=>"Good Things"},
#     "dinner_ids"=>["", "2", "3"]}, "commit"=>"Update Dish", "controller"=>"dishes", "action"=>"update", "id"=>"22"} permitted: false>
