json.results @results do |result|
  json.extract! result, :parcel_number, :year_built, :address, :property_type
end
