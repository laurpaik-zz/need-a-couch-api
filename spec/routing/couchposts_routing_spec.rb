require "rails_helper"

RSpec.describe CouchpostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/couchposts").to route_to("couchposts#index")
    end

    it "routes to #new" do
      expect(:get => "/couchposts/new").to route_to("couchposts#new")
    end

    it "routes to #show" do
      expect(:get => "/couchposts/1").to route_to("couchposts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/couchposts/1/edit").to route_to("couchposts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/couchposts").to route_to("couchposts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/couchposts/1").to route_to("couchposts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/couchposts/1").to route_to("couchposts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/couchposts/1").to route_to("couchposts#destroy", :id => "1")
    end

  end
end
