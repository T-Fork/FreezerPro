#Advanced_search
# Run an advanced subject for sample by variable such as Subject type, Type (SDF/UDF), field and strings.
# add optional parameters after method:
# sdfs: 'value,value': specifies a range of sdfs
# udfs: 'value, value': range of udfs
# start: 'value': specifies what record to start listing from
# limit: 'value': limit number of records to retreive
# sort: 'value': sort the records by a specific value
# dir: 'ASC/DESC": ascending or descending order

require 'rubygems'
require 'net/http'
require 'json'
require 'net/http/post/multipart'

url = $url

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
#:password=>$password,
:auth_token=>$token,
:method=>'advanced_search', 
:subject_type=>'Sample', 
:type=>'sdfs', 
:field=>'description', 
:op=>'contains', 
:value=>'1086833'

res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
end

data = JSON.load(res.body)   
    data.each do |key,value|
        if key == 'Samples'
            value.each do |types|
                puts "--------"
                type.each do |k,v|
                    puts (k.to_s + ": " + v.to_s)
                end
            end
        end
    end

puts "\n"
puts "## Script finished ##" 
total = data['Total']   
puts "Objects found: #{total}"