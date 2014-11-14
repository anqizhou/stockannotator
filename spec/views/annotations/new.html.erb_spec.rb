require 'rails_helper'

RSpec.describe "annotations/new", :type => :view do
  before(:each) do
    assign(:annotation, Annotation.new(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new annotation form" do
    render

    assert_select "form[action=?][method=?]", annotations_path, "post" do

      assert_select "input#annotation_title[name=?]", "annotation[title]"

      assert_select "textarea#annotation_content[name=?]", "annotation[content]"
    end
  end
end
