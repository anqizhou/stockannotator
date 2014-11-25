class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def price
    @prices = Price.all

    @price_array = []

    @prices.each do |p|
      @price_array.push [p.close_date.to_time.to_i * 1000, p.close_price]

    end
  end


  def index
    @stocks = Stock.all
    # @stocks = Stock.where(user: current_user)
    respond_with(@stocks)
  end

  def show
    respond_with(@stock)
  end

  def new
    @stock = Stock.new
    respond_with(@stock)
  end

  def edit
  end

  def create
    @stock = Stock.new(stock_params)
    # @stock.user = current_user
    @stock.save
    respond_with(@stock)
  end

  def update
    @stock.update(stock_params)
    respond_with(@stock)
  end

  def destroy
    @stock.destroy
    respond_with(@stock)
  end

  private
    def set_stock
      @stock = Stock.find(params[:id])
    end

    def stock_params
      params.require(:stock).permit(:ticker)
    end
end
