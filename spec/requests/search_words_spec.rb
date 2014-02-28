require 'spec_helper'

describe "SearchWords" do
  describe "GET /search_words" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get search_words_path
      response.status.should be(200)
    end
  end
end
