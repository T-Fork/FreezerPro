#Get_freezers
#returns the total amount of freezers with id, name and description.
require 'rubygems'
require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = URI.parse('http://130.238.229.22/api')

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
:password=>$pw,
:method=>'freezers'

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end

data = JSON.load(res.body)
    data.each do |key,value|
        if key == "Freezers"
            value.each do |types|
                puts "---------"
                types.each do |k,v|
                    puts (k.to_s + ": " + v.to_s)
                end
            end
        end
    end
puts "\n"
puts "## Script finished ##" 
total = data['Total']   
puts "Objects found: #{total}"
