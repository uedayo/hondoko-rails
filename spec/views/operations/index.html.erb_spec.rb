require 'spec_helper'

describe "operations/index" do
  before(:each) do
    assign(:operations, [
      stub_model(Operation,
        :item => nil,
        :user => nil,
        :operation => 1
      ),
      stub_model(Operation,
        :item => nil,
        :user => nil,
        :operation => 1
      )
    ])
  end

  it "renders a list of operations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
