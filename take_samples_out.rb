#Take_samples_out
#Remove samples specified by barcode, rfid or custom vial id from freezer they are stored in.
#:rfid_tags=>'value'
#:barcode_tags=>'value'
#:custom_ids=>'text'


require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = $url
###it would better to read a csv-file containing barcode/rfid/custom_id###
=begin 
filename = "test"
File.open("./csv/#{filename}.csv") do |csv|

req = Net::HTTP::Post::Multipart.new url.path, 
:file=>UploadIO.new(csv, "text", filename),
=end
json = {:tags=>['1086833,1086834,1086835,1086836,1086837,1086838,1086839,1086830,1086829,1086593'],
:type=>:barcode_tags}

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'take_samples_out',
:json=>json.to_json

res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end

str = res.body
puts str