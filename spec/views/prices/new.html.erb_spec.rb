require 'rails_helper'

RSpec.describe "prices/new", :type => :view do
  before(:each) do
    assign(:price, Price.new(
      :close_price => 1.5
    ))
  end

  it "renders new price form" do
    render

    assert_select "form[action=?][method=?]", prices_path, "post" do

      assert_select "input#price_close_price[name=?]", "price[close_price]"
    end
  end
end
