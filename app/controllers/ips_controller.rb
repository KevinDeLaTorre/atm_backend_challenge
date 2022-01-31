class IpsController < ApplicationController
  require 'net/http'

  SOURCE = "https://get.geojs.io/v1/ip/geo/".freeze

  def index
    @ips = Ip.by_country_and_city(filter_params[:country], filter_params[:city])
    return @ips.to_json
  end

  def create
    uri_source = URI.parse("#{SOURCE}#{create_params}.json")
    resp = Net::HTTP.get_response(uri_source)
    result = JSON.parse(resp.body)
    @ip = Ip.new(country: result['country'], city: result['city'], ip: create_params)
    if @ip.save
      json_response(@ip)
    else
      json_response(@ip, :not_found)
    end
  end

  private

  def filter_params
    params.permit(:country, :city)
  end

  def create_params
    params.require(:ip)
  end
end
