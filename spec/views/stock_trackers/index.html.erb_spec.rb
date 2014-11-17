require 'rails_helper'

RSpec.describe "stock_trackers/index", :type => :view do
  before(:each) do
    assign(:stock_trackers, [
      StockTracker.create!(
        :name => "Name",
        :ticker => "Ticker"
      ),
      StockTracker.create!(
        :name => "Name",
        :ticker => "Ticker"
      )
    ])
  end

  it "renders a list of stock_trackers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ticker".to_s, :count => 2
  end
end
