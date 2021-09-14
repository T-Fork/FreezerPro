#sample_userfields
# show all user fields in a sample by providing ID
#:limit=>'value' limit number of sample records to get

require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = URI.parse('http://130.238.229.22/api')

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
:password=>$pw,
:method=>'sample_userfields', 
:id=>'id' #change id value to the sample to be viewed.

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end

#code
data = JSON.load(res.body)
data.each do |key, value|
    puts (key.to_s + ": " + value.to_s)
end

#\code
   
puts "\n"
puts "## Script finished ##"
total = data['Total']   
puts "Objects found: #{total}"