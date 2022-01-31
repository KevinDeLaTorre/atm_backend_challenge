class IpsController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    @ips = Ip.by_country_and_city(params[:country], params[:city])
    respond_to do |format|
      format.json
    end
  end

  def create
    source = "https://get.geojs.io/v1/ip/geo/#{params[:ip]}.json"
    resp = Net::HTTP.get_response(URI.parse(source))
    result = JSON.parse(resp.body)
    @ip = Ip.new(country: result['country'], city: result['city'], ip: params[:ip])
    if @ip.save
      json_response(@ip)
    else
      json_response(@ip, :not_found)
    end
  end

  private

  def ip_params
    params.permit(:ip, :country, :city)
  end
end
