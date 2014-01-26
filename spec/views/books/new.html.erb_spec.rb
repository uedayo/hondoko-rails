require 'spec_helper'

describe "books/new" do
  before(:each) do
    assign(:book, stub_model(Book,
      :title => "MyString",
      :author => "MyString",
      :manufacturer => "MyString",
      :small_image => "MyString",
      :medium_image => "MyString",
      :detail_page_url => "MyString",
      :category => nil
    ).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", books_path, "post" do
      assert_select "input#book_title[name=?]", "book[title]"
      assert_select "input#book_author[name=?]", "book[author]"
      assert_select "input#book_manufacturer[name=?]", "book[manufacturer]"
      assert_select "input#book_small_image[name=?]", "book[small_image]"
      assert_select "input#book_medium_image[name=?]", "book[medium_image]"
      assert_select "input#book_detail_page_url[name=?]", "book[detail_page_url]"
      assert_select "input#book_category[name=?]", "book[category]"
    end
  end
end
