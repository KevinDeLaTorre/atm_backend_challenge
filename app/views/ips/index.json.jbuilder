@ips.each do |ip|
  json.set! ip.ip do
    json.country ip.country
    json.city ip.city
  end
end
