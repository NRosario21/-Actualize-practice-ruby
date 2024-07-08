require "sqlite3"
require "tty-table"

db = SQLite3::Database.open "store_items.db"
db.execute "CREATE TABLE IF NOT EXISTS store_items(id INTEGER PRIMARY KEY, item TEXT, price INTEGER, color TEXT, available INTEGER)"

while true
  system "clear"
  results = db.query "SELECT * FROM store_items"
  header = ["id", "item", "price", "color", "available"]
  rows = results.to_a
  table = TTY::Table.new header, rows
  puts "STORE_ITEMS (#{rows.length} total)"
  puts table.render(:unicode)
  puts
  print "[C]reate [R]ead [U]pdate [D]elete [Q]uit: "
  input_choice = gets.chomp.downcase
  if input_choice == "c"
    print "Item: "
    input_item = gets.chomp
    print "Price: "
    input_price = gets.chomp.to_i
    print "Color: "
    input_color = gets.chomp
    db.execute "INSERT INTO store_items (item, price, color, available) VALUES (?, ?, ?, ?)", [input_item, input_price, input_color, 1]
  elsif input_choice == "r"
    print "Item id: "
    input_id = gets.chomp.to_i
    results = db.query "SELECT * FROM store_items WHERE id = ?", input_id
    first_result = results.next
    puts "Id: #{first_result[1]}"
    puts "Item #{first_result[2]}"
    puts "Price #{first_result[3]}"
    puts "Color #{first_result[4]}"
    puts
    print "Press enter to continue"
    gets.chomp
  elsif input_choice == "u"
    print "Item id: "
    input_id = gets.chomp.to_i
    print "Update available status (true or false): "
    input_available = gets.chomp
    if input_available == "true"
      input_available = 1
    else
      input_available = 0
    end
    db.execute "UPDATE store_items SET available = ? WHERE id = ?", [input_available, input_id]
  elsif input_choice == "d"
    puts "Delete item"
    print "Enter item id: "
    input_id = gets.chomp.to_i
    db.execute "Delete FROM store_items WHERE id = ?", input_id
  elsif input_choice == "q"
    system "clear"
    puts "Goodbye!"
    return
  else
    puts "Invalid choice"
    print "Press enter to continue"
    gets.chomp
  end
end
