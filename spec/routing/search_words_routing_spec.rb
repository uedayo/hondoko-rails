require "spec_helper"

describe SearchWordsController do
  describe "routing" do

    it "routes to #index" do
      get("/search_words").should route_to("search_words#index")
    end

    it "routes to #new" do
      get("/search_words/new").should route_to("search_words#new")
    end

    it "routes to #show" do
      get("/search_words/1").should route_to("search_words#show", :id => "1")
    end

    it "routes to #edit" do
      get("/search_words/1/edit").should route_to("search_words#edit", :id => "1")
    end

    it "routes to #create" do
      post("/search_words").should route_to("search_words#create")
    end

    it "routes to #update" do
      put("/search_words/1").should route_to("search_words#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/search_words/1").should route_to("search_words#destroy", :id => "1")
    end

  end
end
