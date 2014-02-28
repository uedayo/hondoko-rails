require "spec_helper"

describe BrowsesController do
  describe "routing" do

    it "routes to #index" do
      get("/browses").should route_to("browses#index")
    end

    it "routes to #new" do
      get("/browses/new").should route_to("browses#new")
    end

    it "routes to #show" do
      get("/browses/1").should route_to("browses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/browses/1/edit").should route_to("browses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/browses").should route_to("browses#create")
    end

    it "routes to #update" do
      put("/browses/1").should route_to("browses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/browses/1").should route_to("browses#destroy", :id => "1")
    end

  end
end
