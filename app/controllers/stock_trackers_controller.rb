class StockTrackersController < ApplicationController
  before_action :set_stock_tracker, only: [:show, :edit, :update, :destroy]

  def index
    @stock_trackers = StockTracker.all
    respond_with(@stock_trackers)
  end

  def show
    respond_with(@stock_tracker)
  end

  def new
    @stock_tracker = StockTracker.new
    respond_with(@stock_tracker)
  end

  def edit
  end

  def create
    @stock_tracker = StockTracker.new(stock_tracker_params)
    @stock_tracker.save
    respond_with(@stock_tracker)
  end

  def update
    @stock_tracker.update(stock_tracker_params)
    respond_with(@stock_tracker)
  end

  def destroy
    @stock_tracker.destroy
    respond_with(@stock_tracker)
  end

  private
    def set_stock_tracker
      @stock_tracker = StockTracker.find(params[:id])
    end

    def stock_tracker_params
      params.require(:stock_tracker).permit(:name, :ticker)
    end
end
