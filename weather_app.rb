# require "http"

# response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")
# data = response.parse

# puts "The first person's name is #{data[0]["name"]}"

require "http"

puts "Would you like the temperature in Farenheit or Celcius?"
input_unit = gets.chomp
unit = ""
if input_unit == "f"
  puts "You chose imperial"
  unit = "imperial"
elsif input_unit == "c"
  puts "You chose metric"
  unit = "metric"
end

while true
  puts "In what city would you like to see the temperature? (or hit q to quit)"
  input_city = gets.chomp
  if input_city == "q"
    puts "Thank you for using our wonderful weather app"
    return
  end

  get_string = "https://api.openweathermap.org/data/2.5/weather?q=" + input_city + "&units=" + unit + "&appid=#{ENV["OPEN_WEATHER_API_KEY"]}"
  response = HTTP.get(get_string)

  data = response.parse
  puts "The low temperature in #{input_city} is #{data["main"]["temp_min"]} and the high temperature is #{data["main"]["temp_max"]} degrees with #{data["weather"][0]["description"]}"
  puts "Current temperature is #{data["main"]["temp"]}"
end
