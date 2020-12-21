class CommentsController < ApplicationController
  def create
    @preschool =Preschool.find(params[:preschool_id])
    # binding.pry
    @comment = Comment.create(comment_params)
    @user = User.find(@comment.user_id)
    render json:{ comment: @comment, user: @user }
    # if @comment.save
    #   redirect_to preschool_path(@comment.preschool)
    # else
    #   @preschool = @comment.preschool
    #   @comments = @preschool.comments
    #   render "preschools/show"
    # end
   
  end
  def edit
  end
  def update
  end
  def destroy
    @preschool =Preschool.find(params[:preschool_id])
    @comment =Comment.find(params[:id])
    @comment.destroy
    redirect_to preschool_path(@preschool.id)
  end

  private
  def comment_params
    params.require(:comment)
    .permit(:text).merge(user_id: current_user.id,preschool_id: params[:preschool_id])
  end
end
