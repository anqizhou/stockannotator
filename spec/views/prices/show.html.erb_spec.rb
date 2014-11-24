require 'rails_helper'

RSpec.describe "prices/show", :type => :view do
  before(:each) do
    @price = assign(:price, Price.create!(
      :close_price => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
  end
end
