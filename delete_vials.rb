#Delete_vials
#deletes vials that are stated by providing atleast one rfid tag,
#barcode tag, custom id or vial id. Comma separated list accepted

require 'net/http'
require 'json'
require 'csv'
require 'net/http/post/multipart'

url = $url
#job_id = nil
#data = nil

filename = "test"
file = File.read("./csv/#{filename}.csv").split
dummy_BC = file.join(',')
#puts dummy_BC
req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'delete_vials',
#:rfid_tags=>"355AB1CBC0000010000067D6,355AB1CBC000001000006292",
#:custom_ids=>"Cell Line_26576,Bacteria_26554",
:barcode_tags=>"#{dummy_BC}",
#:vial_id=>"12345,98765",
:comment=>"Jira UBB-1133"

res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end
data = JSON.load(res.body)
$get_status_from_job_id = data["job_id"]
puts data.inspect