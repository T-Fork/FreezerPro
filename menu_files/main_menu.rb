require 'curses'
include Curses
require_relative 'general_ui'
require_relative 'set_server'
require_relative 'credentials'
require_relative 'select_file'

#module Main_Menu
include General_UI
include Set_Server
include Credentials
include Select_File

#setup curses
def init_curses()
    Curses.init_screen
    Curses.start_color #colours no workie work in windows
    Curses.init_pair(1, 3, 0)
    Curses.curs_set(0)#Invisible cursor
    Curses.noecho #no keypress echo
    Curses.cbreak #react to keypress instantly
    Set_Server.set_to_test
end

#main menu
def draw_main_menu(menu)
    menu.attron(color_pair(COLOR_YELLOW)|A_NORMAL)
    x = menu.maxx / 2
    y = menu.maxy / 2
    menu.setpos(y,x)
    menu.setpos(2,0)
    menu.addstr(border)
    menu.addstr(print_header1)
    menu.addstr(print_header2)
    menu.addstr(print_header3)
    menu.addstr(hr)
    menu.addstr(row1)
    menu.addstr(row2)
    menu.addstr(hr)
    menu.addstr(row3)
    menu.addstr(row4)
    menu.addstr(hr)
    menu.addstr(row5)
    menu.addstr(row6)
    menu.addstr(hr)
    menu.addstr(row7)
    menu.addstr(hr)
    menu.addstr(selected_server)
    menu.addstr(currently_selected_server)
    menu.addstr(hr)
    menu.addstr(quit_footer)
    menu.addstr(border)
    #menu.touch
    #menu.redraw
    #menu.refresh
end

def draw_submenu(menu)
    x = menu.maxx / 2
    y = menu.maxy / 2
    menu.setpos(y,x)
    menu.setpos(2,0)
    menu.addstr(border)
    menu.addstr(print_header1)
    menu.addstr(print_header2)
    menu.addstr(print_header3)
    menu.addstr(hr)
    menu.addstr($subchoice)
    menu.addstr(whitespace)
    menu.addstr(whitespace)
    menu.addstr(whitespace)
    menu.addstr(whitespace)
    menu.addstr(whitespace)
    menu.addstr(whitespace)
    menu.addstr(whitespace)
    menu.addstr(whitespace)
    menu.addstr(hr)
    menu.addstr(selected_server)
    menu.addstr(currently_selected_server)
    #menu.addstr(hr)
    #menu.addstr(row7)
    menu.addstr(hr)
    menu.addstr(back_quit_footer)
    menu.addstr(border)
    #menu.touch
    #menu.redraw
    #menu.refresh
end

#running program
position = 0
init_curses()
menu = Curses::Window.new(Curses.lines / 2, Curses.cols / 2, 0, 0)
draw_main_menu(menu)
while choice = menu.getch
    case choice
        when "1"
            $subchoice = "|                   Update sample groups                 |\n"
            draw_submenu(menu)
        when "2"
            $subchoice = "|                       Update boxes                     |\n"
            draw_submenu(menu)
        when "3"
            $subchoice = "|                       Update samples                   |\n"
            draw_submenu(menu)            
        when "4"
            $subchoice = "|                       Update sources                   |\n"
            draw_submenu(menu)
        when "5"
            $subchoice = "|                       Import samples                   |\n"
            draw_submenu(menu)
        when "6"
            $subchoice = "|                       Import sources                   |\n"
            draw_submenu(menu)           
        when "7"
            $subchoice = "|                   Import sample groups                 |\n"
            draw_submenu(menu)
        when "t", "T"
            $subchoice = "|                     Take samples out                   |\n"
            draw_submenu(menu)
        when "p", "P"
            $subchoice = "|                      Put samples in                    |\n"
            draw_submenu(menu)
        when "d", "D"
            $subchoice = "|                       Delete vials                     |\n"
            draw_submenu(menu)
        when "u", "U"
            $subchoice = "|                      Upload file UDF                   |\n"
            draw_submenu(menu)
        when 's', "S"
            prod = "https://freezerpro.regionuppsala.se/"
            #$current_server.to.s
            if $current_server.to_s == prod
                Set_Server.set_to_test
            else
                Set_Server.set_to_prod
            end
            menu.touch
            menu.refresh
        when 'b', 'B'
            draw_main_menu(menu)
        when "q", "Q"
            #Curses.close_screen
            exit
        when 'l', 'L'
            Select_File.File_with_WIN32
    end
    #menu.touch
    #menu.redraw
    #menu.refresh
end
