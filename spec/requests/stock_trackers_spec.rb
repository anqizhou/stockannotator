require 'rails_helper'

RSpec.describe "StockTrackers", :type => :request do
  describe "GET /stock_trackers" do
    it "works! (now write some real specs)" do
      get stock_trackers_path
      expect(response.status).to be(200)
    end
  end
end
