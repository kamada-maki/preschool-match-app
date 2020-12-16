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
  def show
    @preschool =Preschool.find(params[:id])
  end
  def edit
    @preschool =Preschool.find(params[:id])
  end
  
  def update
      @preschool =Preschool.find(params[:id])
    if @preschool.update(preschool_params)
      render :update
    else
      render action: :edit
    end
  end

  def destroy
    @preschool.destroy
    redirect_to root_path
   end
  

  private
  def preschool_params
    params.require(:preschool)
    .permit(:name,:post_number,:area_id, :street_number,:building,:phone_number,:station,:open_hour,:close_hour,:capacity,:category_id,:concept,images: []).merge(admin_id: current_admin.id)
  end
end
