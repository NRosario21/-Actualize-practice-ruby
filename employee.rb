# Represent each employee as a hash

employee1 = { "first_name" => "Majora", "last_name" => "Carter", "salary" => 80000, "active" => true }
employee2 = { "first_name" => "Danilo", "last_name" => "Campos", "salary" => 70000, "active" => true }
puts "#{employee1["first_name"]} #{employee1["last_name"]} makes #{employee1["salary"]} a year"
puts "#{employee2["first_name"]} #{employee2["last_name"]} makes #{employee2["salary"]} a year"

# Represent each employee as a hash with sysmbols

employee1 = { :first_name => "Majora", :last_name => "Carter", :salary => 80000, :active => true }
employee2 = { first_name: "Danilo", last_name: "Campos", salary: 70000, active: true }
puts "#{employee1[:first_name]} #{employee1[:last_name]} makes #{employee1[:salary]} a year"
puts "#{employee2[:first_name]} #{employee2[:last_name]} makes #{employee2[:salary]} a year"

# Represent each employee as an instance of a class

class Employee
  def initialize(input_first_name, input_last_name, input_salary, input_active)
    @first_name = input_first_name
    @last_name = input_last_name
    @salary = input_salary
    @active = input_active
  end

  def print_info
    puts "#{@first_name} #{@last_name} makes #{@salary} a year"
  end

  def give_annual_raise
    @salary = 1.05 * @salary
  end

  def first_name
    return @first_name
  end
end

employee1 = Employee.new("Majora", "Carter", 80000, true)
employee2 = Employee.new("Danilo", "Campos", 70000, true)
employee1.print_info
employee2.print_info
employee1.give_annual_raise
