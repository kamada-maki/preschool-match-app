class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    @preschools = @admin.preschools
  end
end
