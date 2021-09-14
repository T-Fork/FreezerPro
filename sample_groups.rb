#sample groups
#returns a list of all sample groups and additional information
require 'rubygems'
require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = URI.parse('http://130.238.229.22/api')
req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
:password=>$pw,
:method=>'sample_groups'
#,:query=>'text'


res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end

#code
data = JSON.load(res.body)
data.each do |key,value|
    if key == "SampleGroups"
        value.each do |types|
            puts "-----------"
            types.each do |k,v|
                puts (k.to_s + ": " + v.to_s)
            end
        end
    end
end