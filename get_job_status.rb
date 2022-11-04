#get_job_status - Returns the status of import or update job for a given ID
#ERROR = 1 
#DONE = 2 
#PROGRESS = 3 
#CLIENT_ALIVE = 4 
#CANCEL_JOB = 5 

require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = $url

def new_req(url)
    req = Net::HTTP::Post::Multipart.new url.path,
    :username=>$user,
    #:password=>$pw,
    :auth_token=>$token,
    :method=>'get_job_status', 
    :job_id=>$get_status_from_job_id
    #:job_id=>'source_updaters:update:d22e8d68b3477b7499328757404676d1' 
    #:cancel=>$job_id #cancels and rollbacks the transaction. I.e. :cancel=>'source_updaters:update:7d15314c55e7b0e087c0f23dcba29c87'

    @res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
        http.request(req)
    
    end
end

new_req(url)
data = JSON.load(@res.body)
#puts data.inspect
status = data['status']
message = data['msg']
puts "Requesting status for job id: #{$get_status_from_job_id}"
#puts data
puts ""
puts "Status: #{status}"
puts "Message: #{message}"
puts ""


# A check that should keep looping while status == 3 is reported and to break if status != 3.
loop_counter = 1
while status == 3 
    puts "Status response was '3 = progress' i.e. FP is processing.\nWaiting 5s before next retry"
    puts ""
    timer = 5
    while timer != 1
    puts timer
    sleep(1)
    timer -= 1
    end
    new_req(url)
    data = JSON.load(@res.body)
    status = data['status']
    message = data['msg']
    if status == 3
        puts ""
        puts "Try number: #{loop_counter}"
        puts "Server still reports #{status} = #{message}"
        puts "Waiting for 5s and checking again."
        loop_counter += 1
    else
        puts ""
        puts "Status: #{status}"
        puts "Message: #{message}"
    end 
end
