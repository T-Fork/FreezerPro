#Delete_vials
#deletes vials that are stated by providing a tag
require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = $url
#json = {:tags=>['value1,value2,value3'],:type=>:barcode_tags}
json = {:tags=>['1086833'],:type=>:barcode_tags}
req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$password,
:auth_token=>$token,
:method=>'delete_vials',
:json=>json.to_json,
#:rfid_tags=>"355AB1CBC0000010000067D6,355AB1CBC000001000006292",
#:barcode_tags=>"1026556,1026590",
#:custom_ids=>"Cell Line_26576,Bacteria_26554",
#:vial_id=>"12345,98765",
:comment=>"API test"
#proivde atleast one rfid tag, barcode tag, custom id or vial id. Comma separated list accepted

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end
#code

str = res.body
#puts str
#/code