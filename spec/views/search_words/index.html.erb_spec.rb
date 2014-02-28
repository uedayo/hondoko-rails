require 'spec_helper'

describe "search_words/index" do
  before(:each) do
    assign(:search_words, [
      stub_model(SearchWord,
        :user => nil,
        :word => "Word"
      ),
      stub_model(SearchWord,
        :user => nil,
        :word => "Word"
      )
    ])
  end

  it "renders a list of search_words" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Word".to_s, :count => 2
  end
end
