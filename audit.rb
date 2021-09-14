#Audit
#prints audit records and list all related information.   
#add any of the Optional query parameters by copy and pasting <, :function=>'value'> after <:method=>''>   
#, :date_flag=>'all/today/yesterday/week/month': Allows user to search for a specific date   
#, :date_flag=>'date from,date to': Allows user to search a specific date range   
#add any of the optional control parameters by copy and pasting <, :function=>'value'> after <:method=>'' >:   
#, :start=>'value': specifies what record to start listing from   
#, :limit=>'value': limit number of records to retrieve   
#, :sort=>'value': sort the records by a specific value   
#, :dir=>'ASC/DESC': sort the records in ascending or descending order   

require 'rubygems'   
require 'json'   
require 'net/http'   
require 'net/http/post/multipart'   
   
url = URI.parse('http://130.238.229.22/api')

req = Net::HTTP::Post::Multipart.new url.path,
:username=>$user,
:password=>$pw,
:method=>'audit'
#, date_flag=>'all'
#, date_flag=>'date from,date to'  
   
res = Net::HTTP.start(url.host, url.port) do |http|   
http.request(req)
end   
   
data = JSON.load(res.body)   
	data.each do |key,value|   
        if key == "AuditRec"   
            value.each do |types|   
                puts "--------------"   
                types.each do |k,v|   
                    puts (k.to_s + ": " + v.to_s)   
            end   
        end   
    end   
end
puts "\n"
puts "## Script finished ##" 
total = data['Total']   
puts "Objects found: #{total}"