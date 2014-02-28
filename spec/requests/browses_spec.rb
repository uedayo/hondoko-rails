require 'spec_helper'

describe "Browses" do
  describe "GET /browses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get browses_path
      response.status.should be(200)
    end
  end
end
