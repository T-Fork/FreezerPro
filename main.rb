print "Enter username: "
$user = gets.chomp
while $user == ""
    puts "No username provided"
    puts "Enter username: "
    $user = gets.chomp
end
print "Enter password: "
$password = gets.chomp
while $password == ""
    puts "No password provided"
    puts "Enter password: "
    $password = gets.chomp
end

require_relative "gen_token"
$pw = $token
require_relative "freezers.rb"
=begin
print "Enter ID: "
id = gets.chomp
while id == ""
    puts "no ID entered"
    print "Enter ID: "
    id = gets.chomp
end
include sample_userfields.rb
=end

=begin
print "Enter Sample type: "
sample_type = gets.chomp
while sample_type == ""
    puts "no sample type entered"
    print "Enter sample type: "
    sample_type = gets.chomp
end

puts "Looking for #{id} of #{sample_type} sample type"
=end