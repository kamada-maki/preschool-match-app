class PreschoolsController < ApplicationController
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
    # @preschools = Preschool.all.order("created_at DESC")
    @q = Preschool.ransack(params[:q])
    @preschools = @q.result(distinct: true)
  end

  def search
    @q = Preschool.search(search_params)
    @preschools = @q.result(distinct: true)
  end

  def new
    @preschool = Preschool.new
  end

  def create
    @preschool = Preschool.new(preschool_params)
    if @preschool.save
      render :create
    else
      render :new
    end
  end

  def show
    @preschool = Preschool.find(params[:id])
    @comment = Comment.new
    @comments = @preschool.comments.includes(:user).order(created_at: :DESC)
  end

  def edit
    @preschool = Preschool.find(params[:id])
  end

  def update
    @preschool = Preschool.find(params[:id])
    if @preschool.update(preschool_params)
      render :update
    else
      render :edit
    end
  end

  def destroy
    @preschool = Preschool.find(params[:id])
    @preschool.destroy
    render :destroy
  end

  private

  def preschool_params
    params.require(:preschool)
          .permit(:name, :post_number, :area_id, :address, :building, :phone_number, :access, :open_hour, :close_hour, :capacity,
                  :category_id, :concept, :email, images: []).merge(admin_id: current_admin.id)
  end

  def move_to_index
    @preschool = Preschool.find(params[:id])
    redirect_to action: :index unless admin_signed_in? && @preschool.admin_id == current_admin.id
  end

  def search_params
    params.require(:q).permit!
  end
end
