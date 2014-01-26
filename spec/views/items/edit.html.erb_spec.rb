require 'spec_helper'

describe "items/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :book => nil,
      :volume => 1,
      :area => nil
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", item_path(@item), "post" do
      assert_select "input#item_book[name=?]", "item[book]"
      assert_select "input#item_volume[name=?]", "item[volume]"
      assert_select "input#item_area[name=?]", "item[area]"
    end
  end
end
