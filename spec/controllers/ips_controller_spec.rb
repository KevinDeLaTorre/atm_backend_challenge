require 'rails_helper'

RSpec.describe "Ips", type: :request do
  describe "GET /ips" do
    it "returns http success on index" do
      ip = Ip.create(ip: "1.1.1.1", city: "Chicago", country: "United States")
      get '/ips', headers: { accept: "application/json" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({ip.ip => { "country" => ip.country, "city" => ip.city }})
    end

    it "creates ip on post" do
      result = { country: "United States", city: "Chicago" }.to_json
      chicago_ip = "108.115.189.241"
      allow(Net::HTTP).to receive(:get_response).with( URI.parse("https://get.geojs.io/v1/ip/geo/#{chicago_ip}.json")) { OpenStruct.new(body: result) }
      post '/ips', :params => { ip: chicago_ip }
      expect(response.body).to include("Chicago")
    end

    it "fails on ip without city/country" do
      result = { country: nil, city: nil }.to_json
      invalid_ip = "8.8.8.8"
      allow(Net::HTTP).to receive(:get_response).with( URI.parse("https://get.geojs.io/v1/ip/geo/#{invalid_ip}.json")) { OpenStruct.new(body: result) }
      #allow(Net::HTTP).to receive(:get_response) { result }
      post '/ips', :params => { ip: invalid_ip }
      expect(response).to have_http_status(:not_found)
    end
  end
end
