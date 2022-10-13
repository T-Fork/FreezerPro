#Location_info
#returns the location of a vial and additional information as specified by id or barcode.

require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = $url
req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'location_info',
:barcode=>'123456'
#:id=>'12345'
res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end
#code
data = JSON.load(res.body)
data.each do |key,value|
    puts (key.to_s + ": " + value.to_s)
end