require 'spec_helper'

describe "books/index" do
  before(:each) do
    assign(:books, [
      stub_model(Book,
        :title => "Title",
        :author => "Author",
        :manufacturer => "Manufacturer",
        :small_image => "Small Image",
        :medium_image => "Medium Image",
        :detail_page_url => "Detail Page Url",
        :category => nil
      ),
      stub_model(Book,
        :title => "Title",
        :author => "Author",
        :manufacturer => "Manufacturer",
        :small_image => "Small Image",
        :medium_image => "Medium Image",
        :detail_page_url => "Detail Page Url",
        :category => nil
      )
    ])
  end

  it "renders a list of books" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    assert_select "tr>td", :text => "Small Image".to_s, :count => 2
    assert_select "tr>td", :text => "Medium Image".to_s, :count => 2
    assert_select "tr>td", :text => "Detail Page Url".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
