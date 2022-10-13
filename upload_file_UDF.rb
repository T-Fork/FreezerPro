#upload_file_UDF
#upload a file to a sample as specified by ID

require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = $url
File.open("./csv/file.csv") do |csv| #enter filepath and file name

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'upload_file_udf', 
:file=>UploadIO.new(csv, "text", "file.csv"),
:id=>'22222',



res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end

#code
str = res.body
puts str
end
