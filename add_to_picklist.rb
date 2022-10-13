#add_to_picklist
#returns information within a box as specified by id
#:query=>'text'

require 'json'
require 'net/http'
require 'net/http/post/multipart'

#call should provide at least one of the following: rfid_tag, barcode_tag, custom_id or vials_id.
#json = {:tags=>[value1,value2,value3],:type=>:barcode_tags}
#:barcode_tags=>'value'
#rfid_tags=>'value'
#custom_ids=>'text'
#vials_ids=>'value'

url = $url
req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'add_to_picklist',
:picklist_name=>'Api_testpicklist', #name of the picklist
#:picklist=>'2', #optional, internal id of a picklist
:create_picklist=>true, #if true the pick list will be created if it is not found
#:json=>json.to_json
:barcode_tags=>'1086833,1086834,1086835,1086836,1086837,1086838,1086839,1086830,1086829,1086593'

res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end

#code
str = res.body
puts str