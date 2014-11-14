require 'rails_helper'

RSpec.describe "annotations/edit", :type => :view do
  before(:each) do
    @annotation = assign(:annotation, Annotation.create!(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit annotation form" do
    render

    assert_select "form[action=?][method=?]", annotation_path(@annotation), "post" do

      assert_select "input#annotation_title[name=?]", "annotation[title]"

      assert_select "textarea#annotation_content[name=?]", "annotation[content]"
    end
  end
end
