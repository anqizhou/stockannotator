require 'rails_helper'

RSpec.describe "annotations/show", :type => :view do
  before(:each) do
    @annotation = assign(:annotation, Annotation.create!(
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
