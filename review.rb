# foods = []

# 5.times do |i|
#   puts = "Please enter your favorite food #{i + 1}:"
#   food = gets.chomp
#   foods << (food)
# end

# foods.each_with_index do |food, index|
#   puts "#{index + 1}. I love #{food}"
# end

def generate_account_number
  return rand(999999999)
end

users = []

5.times do |i|
  puts "Enter user information #{i + 1}:"
  p "First Name: "
  first_name = gets.chomp

  p "Last Name: "
  last_name = gets.chomp

  p "Email:"
  email = gets.chomp

  account_number = generate_account_number
  user = { first_name: first_name, last_name: last_name, email: email, account_number: account_number }

  users.push(user)
end
puts "n\** All Users **"
users.each do |user|
  puts " - First Name: #{user[:first_name]}"
  puts " - Last Name: #{user[:last_name]}"
  puts " - Email: #{user[:email]}"
  puts " - Account Number: #{user[:account_number]}"
  puts "\n"
end
