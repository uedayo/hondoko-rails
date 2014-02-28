require 'spec_helper'

describe "browses/index" do
  before(:each) do
    assign(:browses, [
      stub_model(Browse,
        :user => nil,
        :book => nil,
        :search_word => nil
      ),
      stub_model(Browse,
        :user => nil,
        :book => nil,
        :search_word => nil
      )
    ])
  end

  it "renders a list of browses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
