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

#call gen_token first before calling i.e. import functions
require_relative "gen_token"

#create loop or statement
require_relative "test.rb"
