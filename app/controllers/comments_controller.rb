class CommentsController < ApplicationController

  def create
    Dinner.find(params[:dinner_id]).comments << Comment.create(comment_params)
    redirect_to dinner_path(params[:dinner_id])
  end


  def comment_params
    params.require(:comment).permit(:user_id, :content, :dinner_id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to dinner_path(params[:dinner_id])
  end

end
