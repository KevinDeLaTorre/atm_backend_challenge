require 'rails_helper'

RSpec.describe Ip, type: :model do
  it "is valid with an ip, country, and city" do
    ip = Ip.new(ip: "8.8.8.8", country: "United States", city: "Chicago")
    expect(ip).to be_valid
  end
end
