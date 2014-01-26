require 'spec_helper'

describe "books/show" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :title => "Title",
      :author => "Author",
      :manufacturer => "Manufacturer",
      :small_image => "Small Image",
      :medium_image => "Medium Image",
      :detail_page_url => "Detail Page Url",
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Author/)
    rendered.should match(/Manufacturer/)
    rendered.should match(/Small Image/)
    rendered.should match(/Medium Image/)
    rendered.should match(/Detail Page Url/)
    rendered.should match(//)
  end
end
