require "spec_helper"

describe CheckInsController do
  describe "routing" do

    it "routes to #index" do
      get("/check_ins").should route_to("check_ins#index")
    end

    it "routes to #new" do
      get("/check_ins/new").should route_to("check_ins#new")
    end

    it "routes to #show" do
      get("/check_ins/1").should route_to("check_ins#show", :id => "1")
    end

    it "routes to #edit" do
      get("/check_ins/1/edit").should route_to("check_ins#edit", :id => "1")
    end

    it "routes to #create" do
      post("/check_ins").should route_to("check_ins#create")
    end

    it "routes to #update" do
      put("/check_ins/1").should route_to("check_ins#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/check_ins/1").should route_to("check_ins#destroy", :id => "1")
    end

  end
end
