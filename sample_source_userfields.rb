#sample source userfields
#Print the number of user fields for a specific sample
require 'rubygems'
require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = $url
req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'sample_source_userfields',
:id=>'1551'

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end

#code
data = JSON.load(res.body)
data.each do |key,value|
    puts (key.to_s + ": " + value.to_s)
end
