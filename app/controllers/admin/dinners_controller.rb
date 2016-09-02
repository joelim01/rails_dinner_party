class Admin::DinnersController < ApplicationController
  before_filter :admin_only

  def index
    @dinners = Dinner.all
  end
end
