require 'rails_helper'

RSpec.describe "stock_trackers/edit", :type => :view do
  before(:each) do
    @stock_tracker = assign(:stock_tracker, StockTracker.create!(
      :name => "MyString",
      :ticker => "MyString"
    ))
  end

  it "renders the edit stock_tracker form" do
    render

    assert_select "form[action=?][method=?]", stock_tracker_path(@stock_tracker), "post" do

      assert_select "input#stock_tracker_name[name=?]", "stock_tracker[name]"

      assert_select "input#stock_tracker_ticker[name=?]", "stock_tracker[ticker]"
    end
  end
end
