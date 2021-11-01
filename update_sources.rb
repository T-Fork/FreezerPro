#update sources
#updates sources as specified by csv file
=begin
genereated reports state ID which needs to be changed to UID before import.
to empty UDF field use double quotes "" 
E.g.
UID,(SC) Diagnosis OLD
10497,""
10498,""
10499,"" 
=end

require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'
require 'csv'

url = $url
job_id = nil
data = nil
File.open("./csv/test.csv") do |csv| 

req = Net::HTTP::Post::Multipart.new url.path, :file=>UploadIO.new(csv, "text", "test.csv"),
:username=>$user,
#:password=>$password,
:auth_token=>$token,
:method=>'update_sources', 
:sample_source_type=>'(SC) OTHERS', #enter sample source type to change
:background_job=>'true'

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end
#code
data = JSON.load(res.body)
$get_status_from_job_id = data["job_id"]
#puts data.inspect
end
require_relative "get_job_status.rb"
   
#puts "\n"
#puts "## Script finished ##" 
