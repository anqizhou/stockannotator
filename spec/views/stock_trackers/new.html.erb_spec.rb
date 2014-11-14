require 'rails_helper'

RSpec.describe "stock_trackers/new", :type => :view do
  before(:each) do
    assign(:stock_tracker, StockTracker.new(
      :name => "MyString",
      :ticker => "MyString"
    ))
  end

  it "renders new stock_tracker form" do
    render

    assert_select "form[action=?][method=?]", stock_trackers_path, "post" do

      assert_select "input#stock_tracker_name[name=?]", "stock_tracker[name]"

      assert_select "input#stock_tracker_ticker[name=?]", "stock_tracker[ticker]"
    end
  end
end
