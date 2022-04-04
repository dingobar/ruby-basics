# print Hello World to console
puts 'Hello World'

#     Multi
#     line
#     comment

# Variables
my_var = 5
puts my_var

# Operations
x = 5
y = 10
sum = x + y

puts "The sum of #{x} and #{y} is #{sum}"

# Integer divison gives integers
puts "#{x}/#{y} = #{x / y}" # 5/10 = 0

# Strings
string_one = 'Hello '
string_two = 'World'
puts string_one + string_two

puts string_one.length
puts (string_one + string_two).upcase

# Control statements
if x > 5
  puts 'x is > 5'
elsif x == 5
  puts 'x is 5'
else
  puts 'x is < 5'
end

playing = false
if playing
  puts "Playing is #{playing} so unless statement executes"
else
  puts "Playing is #{playing} so unless statement didn't execute"
end

puts 'Oh snap!' unless !playing && x == 5 # Prints nothing

# Switch case
num = 0

case num
when 0
  puts 'zero'
when 1
  puts 'one'
else
  puts 'Some number that is not zero or one'
end

# While loop

while num < 10
  puts "Number is now #{num}"
  num += 1
end

# Until loop (?)
num = 0
until num >= 10
  puts "Number is now #{num}"
  num += 1
end

# For-loop
for num in 1...10
  puts num
end

# Each loop
(1...10).each do |p_num|
  puts "Num is now #{p_num}"
end

10.times { puts "Ruby is strange, isn't it!" }

# Collections
days = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]

days.each do |day|
  puts "#{day} is in the weekend!" if %w[Saturday Sunday].include?(day)
end

puts days[0] + ' is the first day of the week.'

# Appending to a list
days << 'Birthday'
days.insert(3, 'Valentines Day')
puts days

# Removing items
day = days.pop
puts "Removed #{day}, days are now just #{days}."
day = days.delete_at(3)
puts "Removed #{day} too, it's not a weekday after all."

# Arrays
arr = [[1, 2], [3, 4]]
arr.each do |z|
  puts "#{z}\n"
end

unsorted = [6, 3, 76, -213, 23, 6, 1, 5, 25]
puts unsorted.sort.to_s

puts arr.flatten.to_s

# Apply function to array
arr_squared = arr.flatten.map { |n| n**2 }
puts arr_squared

# Hash (dictionary)
person_hash = {
  'name' => 'John Snow',
  'age' => 129
}
person_hash['age'] = 'unknown age but probably > 10' # Allowed to change types in runtime

puts "#{person_hash['name']} is #{person_hash['age']} years old"

# Iterate dict items
person_hash.each do |k, v|
  puts "#{k} => #{v}"
end

puts 'We know the age.' if person_hash.key?('age')

puts person_hash.select do |k, _v|
  k == 'name'
end

puts person_hash.fetch('name')

require 'set'
my_set = Set.new([1, 1, 1, 1, 1, 2, 3, 4, 5, 6, 7, 7, 7, 7, 7, 8])
puts my_set

# Functions

def greetings(name = 'John Snow')
  puts "Hello there, #{name}!"
end

greetings
greetings('Mr. Clownface')

def sum(x, y)
  x + y # Last function line returns
end

puts sum(1112, 9999)

# Arguments specified with asterisk *
def print_all_args(*args)
  puts args
end

print_all_args(foo = 'foo', bar = 'bar', baz = 123)

# Yielding (temporary return)
def yielding_test(name = 'Aurelia')
  puts 'hi'
  yield('Eric')
  puts 'hi'
  yield(name)
end

yielding_test do |n|
  puts "The name is #{n}"
end

# Classes

module Greetings
  def say_hello
    puts 'hello'
  end
end

class Vehicle
  @@wheels = 4
  include Greetings
  def initialize(brand)
    puts 'Vehicle created'
    @brand = brand
  end

  def print_brand
    puts "I'm a #{@brand} with #{@@wheels} wheels"
  end
end

vehicle = Vehicle.new('Audi')

vehicle.print_brand
vehicle.say_hello

# IO

test_file = File.new('my_file.txt', 'w+') # w+ = overwrite

test_file.puts('Writing some text in a file')
test_file.write('And some more')
test_file.close

# Using context block
test_file = File.open('my_other_file.txt', 'w+') do |file|
  file.puts("Here's some text!")
  file.write('Lalala foobar')
end

puts File.read('my_other_file.txt')

# Console input
# puts 'Enter your name: '
# name = gets
# puts "Hello #{name}"

# HTTP requests
require 'net/http'
require 'uri'
require 'json'
http_response = Net::HTTP.get_response('www.google.com', '/')
puts http_response.code

uri = URI('http://www.example.com/sample.json')
response = Net::HTTP.get(uri)

# Unit tests
require 'test/unit/assertions'
include Test::Unit::Assertions

assert_equal http_response.code, '200', 'Http request to google should give code 200'
assert_equal sum(1, 2), 3, 'sum(1,2) should equal 3'
