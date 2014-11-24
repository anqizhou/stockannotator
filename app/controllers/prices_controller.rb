class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]

  def index
    @prices = Price.all
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

# Define get data
  def load
#Experiment with Yahoo finance API
    binding.pry
    @stocks = Stock.all
    @stocks.each do |i|
      data = YahooFinance.historical_quotes(i.ticker, Time::now-(24*60*60*3650), Time::now, { raw: false, period: :daily })
      data.each do |j|
        Price.create(close_date:j.trade_date, close_price:j.close, stock_id:i.id)
      end
    end
#Experiment with Yahoo finance above
  end


  private
    def set_price
      @price = Price.find(params[:id])
    end

    def price_params
      params.require(:price).permit(:close_date, :close_price)
    end
end
