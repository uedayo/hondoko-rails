require 'spec_helper'

describe "browses/new" do
  before(:each) do
    assign(:browse, stub_model(Browse,
      :user => nil,
      :book => nil,
      :search_word => nil
    ).as_new_record)
  end

  it "renders new browse form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", browses_path, "post" do
      assert_select "input#browse_user[name=?]", "browse[user]"
      assert_select "input#browse_book[name=?]", "browse[book]"
      assert_select "input#browse_search_word[name=?]", "browse[search_word]"
    end
  end
end
