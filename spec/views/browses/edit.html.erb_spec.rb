require 'spec_helper'

describe "browses/edit" do
  before(:each) do
    @browse = assign(:browse, stub_model(Browse,
      :user => nil,
      :book => nil,
      :search_word => nil
    ))
  end

  it "renders the edit browse form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", browse_path(@browse), "post" do
      assert_select "input#browse_user[name=?]", "browse[user]"
      assert_select "input#browse_book[name=?]", "browse[book]"
      assert_select "input#browse_search_word[name=?]", "browse[search_word]"
    end
  end
end
