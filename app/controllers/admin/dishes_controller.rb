class DishesController < ApplicationController
  before_filter :admin_only
end
