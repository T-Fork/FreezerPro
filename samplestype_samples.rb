#samplestype_samples
#returns a list of samples from a type as specified by sample type id
#:query=>'text' optional search string


require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = $url
req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'samplestype_samples', 
:id=>'2'


res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end

#code
data = JSON.load(res.body)
data.each do |key,value|
    if key == "Samples"
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
total = data['Total']   
puts "Objects found: #{total}"