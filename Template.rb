#Template
require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = URI.parse('http://130.238.229.22/api')

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
:password=>$pw,
:method=>'method_name'

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end
#code
data = JSON.load(res.body)

#\code
   
puts "\n"
puts "## Script finished ##" 
total = data['Total']   
puts "Objects found: #{total}"