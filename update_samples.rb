#update_samples
#update samples as specified by csv file
require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'
require 'csv'

url = $url
job_id = nil
data = nil
File.open(".\csv\test.csv") do |csv|

req = Net::HTTP::Post::Multipart.new url.path, :file=>UploadIO.new(csv, "text", "test.csv"),
:username=>$user,
#:password=>$password,
:auth_token=>$token,
:method=>'update_samples',
:background_job=>'true'

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end
#code
data = JSON.load(res.body)
job_id = data ["job_id"]
puts data.inspect
end
#\code
   
puts "\n"
puts "## Script finished ##" 