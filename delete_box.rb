#Delete box
#Deletes a box, when using ":force=>"Yes"" it allows deletion of 
#non-empty boxes

require 'net/http'
require 'json'
require 'net/http/post/multipart'
require 'csv'

url = $url
filename = 'test'
file = File.read("./csv/#{filename}.csv").split
box_id = file.join(',')
req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'delete_box'
:force=>"Yes"
:id=>"#{box_id}"
:Comment=>"UBB-1133"

res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end
data = JSON.load(res.body)
puts data.inspect
