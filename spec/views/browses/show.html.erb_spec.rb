require 'spec_helper'

describe "browses/show" do
  before(:each) do
    @browse = assign(:browse, stub_model(Browse,
      :user => nil,
      :book => nil,
      :search_word => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
