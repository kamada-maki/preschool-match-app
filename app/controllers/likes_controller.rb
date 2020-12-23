class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(preschool_id: params[:preschool_id])
    redirect_back(fallback_location: root_path)
  end
  def destroy
    @preschool =Preschool.find(params[:preschool_id])
    @like = current_user.likes.find_by(preschool_id: @preschool.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end