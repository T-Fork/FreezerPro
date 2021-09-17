#Freezer_samples
#returns the total number of samples in a freezer or subdivision, and related information, specified by given id
require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = $url

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'freezer_samples', 
:id=>'7716' #substitute number for desired freezer

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end
#code
data = JSON.load(res.body)
    data.each do |key,value|
        if key == 'Samples'
            value.each do |types|
                puts "---------"
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