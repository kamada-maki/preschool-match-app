class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: [:show]
  def show
    @admin = Admin.find(params[:id])
    @preschools = @admin.preschools
  end
  def index
  end
end
