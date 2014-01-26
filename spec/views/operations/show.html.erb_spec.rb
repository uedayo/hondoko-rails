require 'spec_helper'

describe "operations/show" do
  before(:each) do
    @operation = assign(:operation, stub_model(Operation,
      :item => nil,
      :user => nil,
      :operation => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
