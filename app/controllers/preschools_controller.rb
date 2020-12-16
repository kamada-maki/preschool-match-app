class PreschoolsController < ApplicationController
  def index
    @preschools = Preschool.all.order("created_at DESC")
  end
  def new
    @preschool = Preschool.new
  end
  def create
    @preschool =Preschool.new(preschool_params)
    if @preschool.save
     render :create
    else
      render :new
    end
  end  

  private
  def preschool_params
    params.require(:preschool)
    .permit(:name,:post_number,:area_id, :street_number,:building,:phone_number,:station,:open_hour,:close_hour,:capacity,:category_id,:concept,images: []).merge(admin_id: current_admin.id)
  end
end
