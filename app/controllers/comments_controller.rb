class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      if params[:dinner_id]
        Dinner.find(params[:dinner_id]).comments << @comment
        redirect_to dinner_path(params[:dinner_id])
      elsif params[:dish_id]
        Dish.find(params[:dish_id]).comments << @comment
        redirect_to user_dishes_path(current_user)
      end
    else
      if params[:dinner_id]
        @dinner = Dinner.find(params[:dinner_id])
        flash[:error] = @comment.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path)
      elsif params[:dish_id]
        @dish = Dish.find(params[:dish_id])
        flash[:error] = @comment.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content])
      if params[:dinner_id]
        redirect_to dinner_path(params[:dinner_id])
      elsif params[:dish_id]
        redirect_to user_dishes_path(current_user), :flash => { :message => "Comment deleted." }
      end
    else
      if params[:dinner_id]
        @dinner = Dinner.find(params[:dinner_id])
        flash[:error] = @comment.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path)
      elsif params[:dish_id]
        @dish = Dish.find(params[:dish_id])
        flash[:error] = @comment.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    if params[:dinner_id]
      redirect_to dinner_path(params[:dinner_id])
    elsif params[:dish_id]
      redirect_to user_dishes_path(current_user), :flash => { :message => "Comment deleted." }
    end
  end

private
  def comment_params
    params.require(:comment).permit(:user_id, :content, :dinner_id)
  end

end
