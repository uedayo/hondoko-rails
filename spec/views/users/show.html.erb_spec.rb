require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :screen_name => "Screen Name",
      :last_name_kanji => "Last Name Kanji",
      :first_name_kanji => "First Name Kanji",
      :last_name_hiragana => "Last Name Hiragana",
      :first_name_hiragana => "First Name Hiragana",
      :image_url => "Image Url",
      :division => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Screen Name/)
    rendered.should match(/Last Name Kanji/)
    rendered.should match(/First Name Kanji/)
    rendered.should match(/Last Name Hiragana/)
    rendered.should match(/First Name Hiragana/)
    rendered.should match(/Image Url/)
    rendered.should match(//)
  end
end
