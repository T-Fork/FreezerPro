#update sources
#Updates a sample source or set of sample sources via CSV.file. UDFs may be added by adding them as a column in the CSV file. 
#Note: All UDFs must be present in the CSV file and the file must contain the sample source UID, Barcode, or RFID tag. 


require 'net/http'
require 'json'
require 'net/http/post/multipart'
require 'csv'

url = $url
job_id = nil
data = nil
#File.open("./csv/221011_conservative_treatment_test.csv") do |csv|
File.open("./csv/221011_conservative_treatment_test.csv") do |csv|

req = Net::HTTP::Post::Multipart.new url.path, 
:file=>UploadIO.new(csv, "text", "221011_conservative_treatment_test.csv"),
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'update_sources', 
#:sample_source_type=>'SC ICONSS', #enter sample source type to change
:background_job=>'true'

res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end
#code
data = JSON.load(res.body)
$get_status_from_job_id = data["job_id"]
#puts data.inspect
end
#\code
   
#puts "\n"
#puts "## Script finished ##" 
