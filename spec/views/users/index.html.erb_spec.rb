require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :screen_name => "Screen Name",
        :last_name_kanji => "Last Name Kanji",
        :first_name_kanji => "First Name Kanji",
        :last_name_hiragana => "Last Name Hiragana",
        :first_name_hiragana => "First Name Hiragana",
        :image_url => "Image Url",
        :division => nil
      ),
      stub_model(User,
        :screen_name => "Screen Name",
        :last_name_kanji => "Last Name Kanji",
        :first_name_kanji => "First Name Kanji",
        :last_name_hiragana => "Last Name Hiragana",
        :first_name_hiragana => "First Name Hiragana",
        :image_url => "Image Url",
        :division => nil
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name Kanji".to_s, :count => 2
    assert_select "tr>td", :text => "First Name Kanji".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name Hiragana".to_s, :count => 2
    assert_select "tr>td", :text => "First Name Hiragana".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
