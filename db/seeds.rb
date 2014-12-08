require 'open-uri'
require 'csv'
require 'colorize'

# Remove all previous records
puts "Removing old data (#{Property.count} Records Found)..."
Property.destroy_all


# Apartment Records
puts "Parsing Apartments..."
apartments = open("https://dl.dropboxusercontent.com/u/34984839/EXTR_AptComplex.csv")

CSV.read(apartments).each_with_index do |n, i|
  p = Property.new
  p.parcel_number = "#{n[0]}#{n[1]}"
  p.year_built = n[13]
  p.address = n[20].gsub(/\s+/, " ")
  p.property_type = "Apartment"
  p.save
  print ".".colorize(:light_blue) if i % 100 == 0
end

apartments.close
puts "\nApartments Complete..."
puts "[DB contains #{Property.count} records]\n\n"


# Condo Records
puts "Parsing Condos..."
condos = open("https://dl.dropboxusercontent.com/u/34984839/EXTR_CondoComplex.csv")

CSV.read(condos).each_with_index do |n, i|
  p = Property.new
  p.parcel_number = "#{n[0]}0000"
  p.year_built = n[14]
  p.address = n[23].gsub(/\s+/, " ")
  p.property_type = "Condo"
  p.save
  print ".".colorize(:green) if i % 100 == 0
end

condos.close
puts "\nCondos Complete..."
puts "[DB contains #{Property.count} records]\n\n"


# Residential Records
puts "Parsing Residential Buildings..."
residentials = open("https://dl.dropboxusercontent.com/u/34984839/EXTR_ResBldg.csv")

CSV.read(residentials).each_with_index do |n, i|
  p = Property.new
  p.parcel_number = "#{n[0]}#{n[1]}"
  p.year_built = n[43]
  p.address = n[4].gsub(/\s+/, " ")
  p.property_type = "Residential"
  p.save
  print ".".colorize(:yellow) if i % 100 == 0
end

residentials.close
puts "\nResidential Buildings Complete..."
puts "[DB contains #{Property.count} records]\n\n"


# Commercial Records
puts "Parsing Commercial Buildings..."
commercials = open("https://dl.dropboxusercontent.com/u/34984839/EXTR_CommBldg.csv")

CSV.read(commercials).each_with_index do |n, i|
  p = Property.new
  p.parcel_number = "#{n[0]}#{n[1]}"
  p.year_built = n[20]
  p.address = n[4].gsub(/\s+/, " ")
  p.property_type = "Commercial"
  p.save
  print ".".colorize(:magenta) if i % 100 == 0
end

commercials.close
puts "\nCommercial Buildings Complete..."
puts "[DB contains #{Property.count} records]\n\n"


puts "Import Complete!"
