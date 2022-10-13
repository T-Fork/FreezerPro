require 'uri'
module Set_Server

    def set_to_prod()        
        #webadress to FP prod
        $current_server = URI.parse('https://freezerpro.regionuppsala.se/')
        $menu_print = "|          #{$current_server.to_s}          |\n"
    end

    def set_to_test()        
        #webadress to FP test.
        $current_server = URI.parse('https://freezerpro-test.regionuppsala.se/api')
        $menu_print = "|     #{$current_server.to_s}       |\n"
    end
end