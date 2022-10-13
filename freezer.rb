#Freezer — Uniquely identifies a freezer storage, where the samples are located

require 'json'
require 'net/http'
require 'net/http/post/multipart'

url = $url
req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$pw,
:auth_token=>$token,
:method=>'freezer',
:id=>'8558' #8558 should be a Sjöberg freezer


res = Net::HTTP.start(url.host, url.port, :use_ssl => true, :ssl_server_name => url.host, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
    http.request(req)
end

data = JSON.load(res.body)
data.each do |key,value|
    #if key == "errormessage"
        #print "Error"
    #end
    print key
    if key == "Freezer"
        value.each do |types|
            puts "---------"
            types.each do |k,v|
                puts (k.to_s + ": " + v.to_s)
            end
        end
    end

end
puts "\n"
puts "## Finished listing freezers ##" 
total = data['Total']   
puts "Objects found: #{total}"