class CommentsController < ApplicationController

  def create
    @dinner = Dinner.find(params[:dinner_id]).comments << Comment.create(comment_params)
    redirect_to dinner_path(@dinner)
  end


  def comment_params
    params.require(:comment).permit(:user_id, :content, :dinner_id)
  end

end
