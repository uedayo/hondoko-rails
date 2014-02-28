require 'spec_helper'

describe "search_words/show" do
  before(:each) do
    @search_word = assign(:search_word, stub_model(SearchWord,
      :user => nil,
      :word => "Word"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Word/)
  end
end
