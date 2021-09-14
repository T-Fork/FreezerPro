#gen_token
#genereates auth_token which can be used for continous imports. Will prevent audit log flooding.
require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = URI.parse('http://130.238.229.22/api')

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
:password=>$password,
:method=>'gen_token'

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end
#code
data = JSON.load(res.body)
#puts data
token = data.to_s
$token = token [16, 36]
puts token #use this method first before calling import functions.

#\code
   
puts "\n"
puts "## Script finished ##"  