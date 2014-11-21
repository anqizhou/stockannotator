require 'rails_helper'

RSpec.describe "stocks/index", :type => :view do
  before(:each) do
    assign(:stocks, [
      Stock.create!(
        :ticker => "Ticker"
      ),
      Stock.create!(
        :ticker => "Ticker"
      )
    ])
  end

  it "renders a list of stocks" do
    render
    assert_select "tr>td", :text => "Ticker".to_s, :count => 2
  end
end
