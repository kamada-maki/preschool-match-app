class LikesController < ApplicationController

  def create
    @preschool =Preschool.find(params[:preschool_id])
    @like = current_user.likes.create(preschool_id: params[:preschool_id])
    redirect_back(fallback_location: root_path)
    @like.save
    @user = User.find(@comment.user_id)
    html = render_to_string layout: false
    render json:{ like: @like, user: @user, html: html }
  end
  def destroy
    @preschool =Preschool.find(params[:preschool_id])
    @like = current_user.likes.find_by(preschool_id: @preschool.id)
    @like.destroy(params[:id])
    @user = User.find(@comment.user_id)
    html = render_to_string layout: false
    render json:{ like: @like, user: @user, html: html }
  end
end