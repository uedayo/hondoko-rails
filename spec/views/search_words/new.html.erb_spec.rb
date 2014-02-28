require 'spec_helper'

describe "search_words/new" do
  before(:each) do
    assign(:search_word, stub_model(SearchWord,
      :user => nil,
      :word => "MyString"
    ).as_new_record)
  end

  it "renders new search_word form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", search_words_path, "post" do
      assert_select "input#search_word_user[name=?]", "search_word[user]"
      assert_select "input#search_word_word[name=?]", "search_word[word]"
    end
  end
end
