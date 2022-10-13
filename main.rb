#$LOAD_PATH << '\menu_files\' #
#Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }
require 'net/http'
require_relative '.\menu_files\set_server'
require_relative '.\menu_files\credentials'
#require_relative '.\menu_files\main_menu'
#puts 'br1 in main' #used during testing
include Set_Server
include Credentials
#include Main_Menu


#set_server
set_to_test
#set_to_prod
$url = $current_server
puts "Current server is #{$menu_print}"
variable_credentials
#static_credentials
puts "Logging in as #{$user}" #{$user} and #{$password}"
require_relative 'gen_token'
#puts 'br2 in main.rb' #used during testing
#main_ui
require_relative 'update_sources'






puts "Waiting 5s before asking for job status."
#
timer = 5
while timer != 1
    puts timer
    sleep(1)
    timer -= 1
end
require_relative 'get_job_status' #get_job_status keeps looping while status == 3 (working) is reported and to break if status != 3.

