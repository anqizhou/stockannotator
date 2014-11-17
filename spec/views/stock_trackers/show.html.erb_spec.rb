require 'rails_helper'

RSpec.describe "stock_trackers/show", :type => :view do
  before(:each) do
    @stock_tracker = assign(:stock_tracker, StockTracker.create!(
      :name => "Name",
      :ticker => "Ticker"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Ticker/)
  end
end
