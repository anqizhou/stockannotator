class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]

  def index
    @prices = Price.all
    binding.pry
    respond_with(@prices)
  end

  def show
    respond_with(@price)
  end

  def new
    @price = Price.new
    respond_with(@price)
  end

  def edit
  end

  def create
    @price = Price.new(price_params)
    @price.save
    respond_with(@price)
  end

  def update
    @price.update(price_params)
    respond_with(@price)
  end

  def destroy
    @price.destroy
    respond_with(@price)
  end

  private
    def set_price
      @price = Price.find(params[:id])
    end

    def price_params
      params.require(:price).permit(:close_date, :close_price)
    end
end
