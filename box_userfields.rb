#Box_userfields
#Returns the total number of user fields in a box specified by id

require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = $url

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'box_userfields', 
:id=>'4053' #substitute number for desired box

res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end

data = JSON.load(res.body)   
#code
data.each do |key,value|
    #if key == B    
        puts (key.to_s + ": " + value.to_s)
end

#\code
puts "\n"
puts "## Script finished ##" 
total = data['Total']   
puts "Objects found: #{total}"