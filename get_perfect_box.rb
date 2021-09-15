#get_perfect_box
# Returns the ID and location path for a box with the empty position, so import method can use those boxes with sufficient space.
#provide freezer name or ID
#freezer_name: name of freezer where to search for a "perfect" box
#container_id: id of freezer of shelf
#space: box size
require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = URI.parse('http://130.238.229.22/api')

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'get_perfect_box' 
#, :freezer_name=>'text'
#, :space=>'8x8'
#, :container_id=>'value'

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end
#code
data = JSON.load(res.body)
puts data

#\code
   
puts "\n"
puts "## Script finished ##" 
total = data['Total']   
puts "Objects found: #{total}"