class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    @preschool =Preschool.find(params[:id])
    @preschools = @admin.preschools
  end
  def index
  end
end
