# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'csv'

task :test_data => :environment do
  puts "Removing old data (#{Property.count} Records Found)..."
  Property.destroy_all

  puts "Parsing Test Data..."
  apartments = open("vendor/assets/csvs/EXTR_AptComplex.csv")

  CSV.read(apartments).each_with_index do |n, i|
    p = Property.new
    p.parcel_number = "#{n[0]}#{n[1]}"
    p.year_built = n[13]
    p.address = n[20].gsub(/\s+/, " ")
    p.property_type = "Apartment"
    p.save
    print "." if i % 10 == 0
  end

  apartments.close
  puts "\nTest Data Import Complete..."
  puts "[DB contains #{Property.count} records]\n"
end

task :geocode => :environment do
  # magic to get geocode data!
end