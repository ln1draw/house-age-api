json.property @properties do |property|
  json.extract! property, :parcel_number, :year_built, :address, :property_type
end
