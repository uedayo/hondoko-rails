require 'spec_helper'

describe "areas/edit" do
  before(:each) do
    @area = assign(:area, stub_model(Area,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit area form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", area_path(@area), "post" do
      assert_select "input#area_name[name=?]", "area[name]"
      assert_select "input#area_description[name=?]", "area[description]"
    end
  end
end
