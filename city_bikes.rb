require "http"
unit = ""

puts "Are you looking to rent a bike today?"
input_answer = gets.chomp
if input_answer == "yes"
  puts "Great! We can help"
elsif input_city == gets.chomp
  puts "There are rental bikes available"
else
  input_answer == "no"
  puts "Have a great day!"
end

while true
  puts "In which city would you like to rent a bike in?"
  input_city = gets.chomp
  if input_city == "Madrid"
    puts "There are rental bikes available"
    return
  end

  get_string = "https://api.citybik.es/v2/networks?q= + input_city + unit"
  response = HTTP.get(get_string)

  data = response.parse
end
