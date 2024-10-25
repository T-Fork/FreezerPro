#sample_userfields
# show all user fields in a sample by providing ID
#:limit=>'value' limit number of sample records to get


require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = $url

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'sample_userfields', 
:id=>'id' #change id value to the sample to be viewed.

res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
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