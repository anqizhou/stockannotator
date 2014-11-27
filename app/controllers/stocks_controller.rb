

class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def price
    # Only showing one
    @displayStock = Stock.where(ticker:params[:ticker])
    @stockid = @displayStock.first.id
    @prices = Price.where(stock_id: @stockid).order(close_date: :asc)

    @price_array = []

    @prices.each do |p|
      @price_array.push [p.close_date.to_time.to_i * 1000, p.close_price]

    end
    puts @price_array.count
    @price_array
  end


  def index
    #In many to many relationships, need to do current_user.stocks rather than Stock.user because one stock has many users.
    @stocks = current_user.stocks
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
    @stock.save
    #Save the new data entry into current user's portfolio (ie current_user.stocks)
    current_user.stocks << @stock
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
