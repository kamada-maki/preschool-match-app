class CommentsController < ApplicationController
  def create
    @preschool = Preschool.find(params[:preschool_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      @user = User.find(@comment.user_id)
      html = render_to_string layout: false
    else
      @user = nil
      html = nil
    end
    render json: { comment: @comment, user: @user, html: html }
  end

  def edit
  end

  def update
  end

  def destroy
    @preschool = Preschool.find(params[:preschool_id])
    @comment = Comment.destroy(params[:id])
    @user = User.find(@comment.user_id)
    html = render_to_string layout: false
    render json: { comment: @comment, user: @user, html: html }
  end

  private

  def comment_params
    params.require(:comment)
          .permit(:text).merge(user_id: current_user.id, preschool_id: params[:preschool_id])
  end
end
