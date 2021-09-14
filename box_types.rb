#Box_types
#Returns the number of boxes with ID and name of each.
require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = URI.parse('http://130.238.229.22/api')

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
:password=>$pw,
:method=>'box_types'

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end

data = JSON.load(res.body)   
#code
data.each do |key,value|
    if key == 'BoxTypes'
        value.each do |types|
            puts "----------"
            types.each do |k,v|
                puts (k.to_s + ": " + v.to_s)
            end
        end
    end
end

#\code
puts "\n"
puts "## Script finished ##" 
total = data['Total']   
puts "Objects found: #{total}"