require 'open-uri'
require 'csv'

# Remove all previous records
Property.destroy_all


# Commercial Records
commercials = open("https://dl.dropboxusercontent.com/u/34984839/EXTR_CommBldg.csv")

CSV.read(commercials).each do |n|
  p = Property.new
  p.parcel_number = n[0]
  p.year_built = n[20]
  p.address = n[4].gsub(/\s+/, " ")
  p.property_type = "Commercial"
  p.save
end


# Condo Records
condos = open("https://dl.dropboxusercontent.com/u/34984839/EXTR_CondoComplex.csv")

CSV.read(condos).each do |n|
  p = Property.new
  p.parcel_number = n[0]
  p.year_built = n[14]
  p.address = n[23].gsub(/\s+/, " ")
  p.property_type = "Condo"
  p.save
end


# Apartment Records
apartments = open("https://dl.dropboxusercontent.com/u/34984839/EXTR_AptComplex.csv")

CSV.read(apartments).each do |n|
  p = Property.new
  p.parcel_number = n[0]
  p.year_built = n[13]
  p.address = n[20].gsub(/\s+/, " ")
  p.property_type = "Apartment"
  p.save
end


# Residential Records
residentials = open("https://dl.dropboxusercontent.com/u/34984839/EXTR_ResBldg.csv")

CSV.read(residentials).each do |n|
  p = Property.new
  p.parcel_number = n[0]
  p.year_built = n[43]
  p.address = n[4].gsub(/\s+/, " ")
  p.property_type = "Residential"
  p.save
end
