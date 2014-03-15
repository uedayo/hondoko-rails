require 'spec_helper'

describe MaintenanceController do

  describe "GET 'init'" do
    it "returns http success" do
      get 'init'
      response.should be_success
    end
  end

end
