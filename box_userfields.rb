#Box_userfields
#Returns the total number of user fields in a box specified by id
require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = URI.parse('http://130.238.229.22/api')

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
:password=>$pw,
:method=>'box_userfields', 
:id=>'4053' #substitute number for desired box

res = Net::HTTP.start(url.host, url.port) do |http|
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