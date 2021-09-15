#upload_file_UDF
#upload a file to a sample as specified by ID
require 'rubygems'
require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = URI.parse('http://130.238.229.22/api')
File.open("./file.csv") do |csv| #enter filepath and file name

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'upload_file_udf', 
:file=>UploadIO.new(csv, "text", "file.csv"),
:id=>'22222',



res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end

#code
str = res.body
puts str
end
