class PreschoolsController < ApplicationController
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_preschool, only: [:show, :edit, :update, :destroy]
  PER = 6
  def index
    @q = Preschool.ransack(params[:q])
    @preschools = @q.result(distinct: true).page(params[:page]).per(PER)
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
    @comment = Comment.new
    @comments = @preschool.comments.includes(:user).order(created_at: :DESC)
  end

  def edit
  end

  def update
    if @preschool.update(preschool_params)
      render :update
    else
      render :edit
    end
  end

  def destroy
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

  def set_preschool
    @preschool = Preschool.find(params[:id])
  end
end
