puts "=> What's the first number?"
num1 = gets.chomp

puts "=> The number was " + num1

puts "=> What's the second number?"
num2 = gets.chomp

puts "=> The second number was #{num2}, and the class is #{num2.class}"

# puts "=> What operation would you like to perform? 1) add 2) subtract 3) divide 4) multiply"
puts "=> Computer is now randomly choosing an operation..."

arr = ["1", "2", "3", "4"]
operation = arr[rand(4)]
result = nil

if operation == "1"
  result = num1.to_i + num2.to_i
  operation = "add"
elsif operation == "2"
  result = num1.to_i - num2.to_i
  operation = "subtract"
elsif operation == "3"
  result = num1.to_f / num2.to_f
  operation = "divided by"
else
  result = num1.to_i * num2.to_i
  operation = "multiply"
end

puts "=> #{num1} #{operation} #{num2} is: #{result}"