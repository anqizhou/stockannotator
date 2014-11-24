require 'rails_helper'

RSpec.describe "prices/edit", :type => :view do
  before(:each) do
    @price = assign(:price, Price.create!(
      :close_price => 1.5
    ))
  end

  it "renders the edit price form" do
    render

    assert_select "form[action=?][method=?]", price_path(@price), "post" do

      assert_select "input#price_close_price[name=?]", "price[close_price]"
    end
  end
end
