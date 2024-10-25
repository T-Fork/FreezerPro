#gen_token
#generates auth_token which can be used for continous imports. Will prevent audit log flooding.
#use this method first before calling e.g. import functions.

require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = $url
req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
:password=>$password,
:method=>'gen_token'

res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end
#code
data = JSON.load(res.body)
#puts data ###used during dev###
token = data.to_s
#puts token ###used during dev###

if token == '{"error"=>true, "message"=>"Authentication Failed", "success"=>false}'
    puts 'Username or password incorrect'
    puts '## No token created ##'
    puts 'Aborting'
    abort
end

 blipp = token [16, 36]
 $token = "#{blipp}"

puts "## Token created ##"