class Ip < ApplicationRecord
  validates :ip, presence: true
  validates :country, presence: true
  validates :city, presence: true

  def self.by_country_and_city(country = nil, city = nil)
    return where(country: country, city: city) if country && city
    return where(country: country) if country
    return where(city: city) if city
    all
  end

  scope :filter_by_country, -> (country) { where country: country }
  scope :filter_by_city,    -> (city) { where city: city }
  scope :filter_by, -> (city) { where city: city }
end
