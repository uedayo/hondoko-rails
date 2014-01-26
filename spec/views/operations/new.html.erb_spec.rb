require 'spec_helper'

describe "operations/new" do
  before(:each) do
    assign(:operation, stub_model(Operation,
      :item => nil,
      :user => nil,
      :operation => 1
    ).as_new_record)
  end

  it "renders new operation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", operations_path, "post" do
      assert_select "input#operation_item[name=?]", "operation[item]"
      assert_select "input#operation_user[name=?]", "operation[user]"
      assert_select "input#operation_operation[name=?]", "operation[operation]"
    end
  end
end
