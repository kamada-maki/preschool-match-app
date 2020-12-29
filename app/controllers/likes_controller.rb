class LikesController < ApplicationController

  def create
    @preschool =Preschool.find(params[:preschool_id])
    @like = current_user.likes.create(preschool_id: params[:preschool_id])
    @like.save
    @user = User.find(@like.user_id)
    html = render_to_string layout: false
    render json:{ like: @like, user: @user, html: html }
  end
  def destroy
    @preschool =Preschool.find(params[:preschool_id])
    @like = current_user.likes.find_by(preschool_id: @preschool.id)
    @like.destroy
    @user = User.find(@like.user_id)
    html = render_to_string layout: false
    render json:{ like: @like, user: @user, html: html }
  end

  # private
  # def like_params
  #   params.require(:like)
  #   .permit(:id).merge(user_id: current_user.id,preschool_id: params[:preschool_id])
  # end
end