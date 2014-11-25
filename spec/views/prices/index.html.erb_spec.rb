require 'rails_helper'

RSpec.describe "prices/index", :type => :view do
  before(:each) do
    assign(:prices, [
      Price.create!(
        :close_price => 1.5
      ),
      Price.create!(
        :close_price => 1.5
      )
    ])
  end

  it "renders a list of prices" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
