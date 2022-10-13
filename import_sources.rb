#import_sources
#imports sources as specified by csv file


require 'net/http'
require 'json'
require 'net/http/post/multipart'
require 'csv'

url = $url
job_id = nil
data = nil
File.open("./file.csv") do |csv|

req = Net::HTTP::Post::Multipart.new url.path, :file=>UploadIO.new(csv, "text", "file.csv"),
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'import_sources', 
:sample_source_type=>'text', 
:background_job=>'true'

res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end
#code
data = JSON.load(res.body)
$get_status_from_job_id = data["job_id"]
puts data.inspect
end
#\code
   
puts "\n"
puts "## Script finished ##" 