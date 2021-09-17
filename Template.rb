#Template
require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = $url

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
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