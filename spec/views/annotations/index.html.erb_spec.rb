require 'rails_helper'

RSpec.describe "annotations/index", :type => :view do
  before(:each) do
    assign(:annotations, [
      Annotation.create!(
        :title => "Title",
        :content => "MyText"
      ),
      Annotation.create!(
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of annotations" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
