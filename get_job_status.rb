#get_job_status
#Returns the status of import or update job for a given ID


require 'rubygems'
require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = $url

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'get_job_status', 
:job_id=>'sample_group_update:e7878sjjs'
#, :cancel=>'job_id', #cancels and rollbacks the transaction

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end

data = JSON.load(res.body)
puts data

#\code
puts "\n"
puts "## Script finished ##" 




