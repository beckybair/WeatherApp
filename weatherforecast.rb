# WeatherForecast.rb

require 'yahoo_weatherman'

# USER INPUTS THEIR LOCATION
puts "Where are you? (enter zip code)"
zip_code = gets.chomp
 
def get_location(location)
  client = Weatherman::Client.new(unit: 'f')
  client.lookup_by_location(location)
end
 
weather = get_location(zip_code)
 
today = Time.now.strftime('%w').to_i
 
weather.forecasts.each do |forecast|
 
day = forecast['date']
 
weekday = day.strftime('%w').to_i
 
if weekday == today
   dayName = 'Today'
elsif weekday == today + 1
   dayName = 'Tomorrow'
else
   dayName = day.strftime('%A')
end
 
puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s
 
end
