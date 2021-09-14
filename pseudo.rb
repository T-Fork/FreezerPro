=begin
establish connection to gen_token
use token to log in
search for items
list items
find items to be updated
use csv or json-string
=end
=begin
require_relative "method_name"
#variable = gets.chomp
=end

require_relative "test.rb"

print "Enter ID: "
id = gets.chomp
while id == ""
    puts "no ID entered"
    print "Enter ID: "
    id = gets.chomp
end
include sample_userfields.rb
=begin
print "Enter Sample type: "
sample_type = gets.chomp
while sample_type == ""
    puts "no sample type entered"
    print "Enter sample type: "
    sample_type = gets.chomp
end
=end


puts "Looking for #{id} of #{sample_type} sample type"