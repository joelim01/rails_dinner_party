class Admin::CommentsController < ApplicationController
  before_filter :admin_only

  def index
    @comments_for_dinners = Comment.where(commentable_type: "Dinner")
    @comments_for_dishes = Comment.where(commentable_type: "Dish")
  end

end
