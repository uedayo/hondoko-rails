require "spec_helper"

describe CheckOutsController do
  describe "routing" do

    it "routes to #index" do
      get("/check_outs").should route_to("check_outs#index")
    end

    it "routes to #new" do
      get("/check_outs/new").should route_to("check_outs#new")
    end

    it "routes to #show" do
      get("/check_outs/1").should route_to("check_outs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/check_outs/1/edit").should route_to("check_outs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/check_outs").should route_to("check_outs#create")
    end

    it "routes to #update" do
      put("/check_outs/1").should route_to("check_outs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/check_outs/1").should route_to("check_outs#destroy", :id => "1")
    end

  end
end
