require 'rails_helper'

RSpec.describe "Ips", type: :request do
  describe "GET /ips" do
    it "returns http success" do
      get "/ips", :format => :json
      expect(response).to have_http_status(:success)
    end
  end
end
