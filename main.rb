
require 'net/http'
=begin 
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
=end
$user = 'text'
$password = 'text'
$url = URI.parse('http://130.238.229.21/api') #ip to FP prod
#$url = URI.parse('https://freezerpro-test.regionuppsala.se/signin') #ip to FP test.

#call gen_token first before calling e.g. import functions
require_relative "gen_token.rb"

require_relative "update_sources.rb"

#require_relative "test.rb"

require_relative "get_job_status.rb"

#REMOVE_UDF_VALUE