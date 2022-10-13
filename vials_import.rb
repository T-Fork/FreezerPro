#vials_import
#returns informationon a job specified by id
#:query=>'text'


require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = $url
req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'import', 
:job_id=>'importers:import:16s541a616a' #enter value for job ID
#, query=>'text'

res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end

#code
data = JSON.load(res.body)
data.each do |key,value|
    if key == "Locations"
        value.each do |types|
            puts "-----------"
            types.each do |k,v|
                puts (k.to_s + ": " + v.to_s)
            end
        end
    end
end
#\code

puts "\n"
puts "## Script finished ##"
#puts data
total = data['Total']   
puts "Objects found: #{total}"