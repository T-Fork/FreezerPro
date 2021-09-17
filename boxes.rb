#Boxes
#Returns the total number of boxes

require 'rubygems'
require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = $url

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'boxes', 
:show_empty=>'true'
#, :id=>'value'
#, :user_id=>'value'

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end

data = JSON.load(res.body)
#code
data.each do |key,value|
    if key == 'Boxes'
        value.each do |types|
            puts "-----------"
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