require "rails_helper"

RSpec.describe StockTrackersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stock_trackers").to route_to("stock_trackers#index")
    end

    it "routes to #new" do
      expect(:get => "/stock_trackers/new").to route_to("stock_trackers#new")
    end

    it "routes to #show" do
      expect(:get => "/stock_trackers/1").to route_to("stock_trackers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stock_trackers/1/edit").to route_to("stock_trackers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stock_trackers").to route_to("stock_trackers#create")
    end

    it "routes to #update" do
      expect(:put => "/stock_trackers/1").to route_to("stock_trackers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stock_trackers/1").to route_to("stock_trackers#destroy", :id => "1")
    end

  end
end
