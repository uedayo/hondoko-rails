require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :book => nil,
      :volume => 1,
      :area => nil
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", items_path, "post" do
      assert_select "input#item_book[name=?]", "item[book]"
      assert_select "input#item_volume[name=?]", "item[volume]"
      assert_select "input#item_area[name=?]", "item[area]"
    end
  end
end
