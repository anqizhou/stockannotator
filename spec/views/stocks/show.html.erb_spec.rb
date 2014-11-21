require 'rails_helper'

RSpec.describe "stocks/show", :type => :view do
  before(:each) do
    @stock = assign(:stock, Stock.create!(
      :ticker => "Ticker"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ticker/)
  end
end
