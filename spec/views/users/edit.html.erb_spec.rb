require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :screen_name => "MyString",
      :last_name_kanji => "MyString",
      :first_name_kanji => "MyString",
      :last_name_hiragana => "MyString",
      :first_name_hiragana => "MyString",
      :image_url => "MyString",
      :division => nil
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_screen_name[name=?]", "user[screen_name]"
      assert_select "input#user_last_name_kanji[name=?]", "user[last_name_kanji]"
      assert_select "input#user_first_name_kanji[name=?]", "user[first_name_kanji]"
      assert_select "input#user_last_name_hiragana[name=?]", "user[last_name_hiragana]"
      assert_select "input#user_first_name_hiragana[name=?]", "user[first_name_hiragana]"
      assert_select "input#user_image_url[name=?]", "user[image_url]"
      assert_select "input#user_division[name=?]", "user[division]"
    end
  end
end
