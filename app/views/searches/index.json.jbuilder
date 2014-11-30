json.number_of_results @results.size

json.results @results do |result|
  json.extract! result, :parcel_number, :year_built, :address, :property_type
end
