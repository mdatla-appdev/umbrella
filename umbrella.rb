p "Where are you located?"

# user_location = gets.chomp

user_location = "Taj Mahal"

pmaps_token = AIzaSyB92cYxPcYqgjwBJfWlwDQw_7yjuyU3tpA
weather_key = 3RrQrvLmiUayQ84JSxL8D2aXw99yRKlx1N4qFDUE

p user_location

gmaps_api_endpoint = ("https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{pmaps_token}")

require "open-uri"

raw_response = URI.open(gmaps_api_endpoint).read

require "json"

parsed_response = JSON.parse(raw_response)

results_array = parsed_response.fetch("results")

first_results = results_array.at(0)

geo = first_results.fetch("geometry")

loc = geo.fetch("location")

latitude = loc.fetch("lat")

longitude = loc.fetch("lng")

p latitude
p longitude

pirate_weather_key = ("https://api.pirateweather.net/forecast/#{weather_key}/#{latitude},#{longitude}")

raw_weather_response = URI.open(pirate_weather_key).read

# p raw_weather_response

parsed_weather_response = JSON.parse(raw_weather_response)

# p parsed_weather_response

# p parsed_weather_response.keys

currently_hash = parsed_weather_response.fetch("currently")

# p currently_hash

current_temp = currently_hash.fetch("temperature")

p "It is currently #{current_temp} degrees F"

hourly_hash = parsed_weather_response.fetch("hourly")

hourly_data_array = hourly_hash.fetch("data")

# p hourly_data_array

next_twelve_hours = hourly_data_array[1...12]

precip_prob_threshold = 0.10

next_twelve_hours.each do |hour_hash|
  precip_prob = hour_hash.fetch(precipProbability)

if precip_prob > precip_prob_threshold

  any_precipitation = true

  precip_time = Time.at(hour_hash.fetch("Time"))


