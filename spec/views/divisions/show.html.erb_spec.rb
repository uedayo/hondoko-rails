require 'spec_helper'

describe "divisions/show" do
  before(:each) do
    @division = assign(:division, stub_model(Division,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
  end
end
