class PricesController < ApplicationController
  def new
    @price = Price.new
  end

  def create
    @price = Price.create(price_params)
    if @price.save
      render :show
    else
      render :new
    end
  end

  def show
    @price = Price.find(params[:id])
  end

  private

  def price_params
    params.require(:price)
          .permit(:age_id, :category_id, :free_price, :not_free_price)
  end
end
