class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    @preschools = @admin.preschools
    # @preschool = Preschool.find(params[:id])
  end

  def index
  end
end
