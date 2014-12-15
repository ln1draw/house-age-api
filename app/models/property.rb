class Property < ActiveRecord::Base
  validates :address, uniqueness: true

  def geocode_me
    formatted = address.gsub(/ /, "+")
    response  = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{formatted},+Seattle,+WA&key=#{ENV['GOOGLE_KEY']}").parsed_response
    location  = response["results"][0]["geometry"]["location"]
    [location["lat"], location["lng"]]
  end
end
