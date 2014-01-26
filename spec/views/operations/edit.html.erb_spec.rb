require 'spec_helper'

describe "operations/edit" do
  before(:each) do
    @operation = assign(:operation, stub_model(Operation,
      :item => nil,
      :user => nil,
      :operation => 1
    ))
  end

  it "renders the edit operation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", operation_path(@operation), "post" do
      assert_select "input#operation_item[name=?]", "operation[item]"
      assert_select "input#operation_user[name=?]", "operation[user]"
      assert_select "input#operation_operation[name=?]", "operation[operation]"
    end
  end
end
