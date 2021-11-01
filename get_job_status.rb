#get_job_status
#Returns the status of import or update job for a given ID
#ERROR = 1 
#DONE = 2 
#PROGRESS = 3 
#CLIENT_ALIVE = 4 
#CANCEL_JOB = 5 



require 'rubygems'
require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = $url

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$password,
:auth_token=>$token,
:method=>'get_job_status', 
:job_id=>$get_status_from_job_id
#:job_id=>'source_updaters:update:7d15314c55e7b0e087c0f23dcba29c87'
#:cancel=>'source_updaters:update:7d15314c55e7b0e087c0f23dcba29c87'
#:cancel=>$job_id #cancels and rollbacks the transaction


res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end

data = JSON.load(res.body)
status = data['status']
message = data['msg']
puts $get_status_from_job_id
puts data
puts "Status: #{status}"
puts "Message: #{message}"
#\code
puts "\n"
puts "## Script finished ##" 




