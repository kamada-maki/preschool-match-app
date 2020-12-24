class UsersController < ApplicationController  
  def show
    @user = User.find(params[:id])
    @preschools = Preschool.all
    # likes = like.where(user_id: current_user.id).pluck(:preschool_id)  
    # @like_list = preschool.find(likes) 
  end
end
