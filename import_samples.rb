#import samples
#import samples as specified by csv file
#Importfile should contain a sample type column, boxpath column


require 'net/http'
require 'json'
require 'net/http/post/multipart'
require 'csv'

url = $url
job_id = nil
data = nil
File.open("./file.csv") do |csv| #enter filepath and file name

req = Net::HTTP::Post::Multipart.new url.path, :file=>UploadIO.new(csv, "text", "file.csv"),
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'import_samples', 
#:box_path=>'Freezername, Level 1, Box 1' #will override path set in csv
#,:sample_type=>'text' #name of sample type import, otherwise the csv should contain this column
#,:create_storage=>'true' #option to create freezer/racks/shelves and boxes.
#,:box_type=>'value' #this is required when create_storage is used. ex. box_type=>'8x8'
#,:subdivision_barcode=>'value' #import to the first available location in subdivision
:next_box=>'true', #if set to true the import will continue on the next box in the freezer tree
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