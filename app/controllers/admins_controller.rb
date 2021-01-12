class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: [:show]
  def show
    @admin = Admin.find(params[:id])
    @preschools = @admin.preschools
    # @preschool = Preschool.find(params[:id])
  end

  def index
  end
end
