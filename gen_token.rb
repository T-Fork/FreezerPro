#gen_token
#generates auth_token which can be used for continous imports. Will prevent audit log flooding.
#use this method first before calling e.g. import functions.
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
#puts token

if token == '{"error"=>true, "message"=>"Authentication Failed", "success"=>false}'
    puts 'Username or password incorrect'
    puts '## No token created ##'
    abort
end

$token = token [16, 36]
#
#\code
puts "## Token created ##"