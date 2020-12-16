class PreschoolsController < ApplicationController
  def index
    @preschools = Preschool.all.order("created_at DESC")
  end
  def new
    @preschool = Preschool.new(preschool_params)
  end
  def create
    @preschool =Preschool.new(preschool_params)
  end  

  rivate
  def preschool_params
    params.require(:preschool)
    .permit(:name,:post_number,:area_id, :street_number,:building,:phone_number,:station,:open_hour,:close_hour,:capacity,:category_id,:concept,images: []).merge(admin_id: current_admin.id)
  end
end
