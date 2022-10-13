module General_UI
  #this module contains the bits 
#ui total width = 58 chars
  def border()  
    "*========================================================*\n"  
  end

  def hr()  
    "|--------------------------------------------------------|\n"  
  end
  
  def row1()
    "| 1) [Update sample groups]   | 2) [Update boxes]        |\n"
  end
  
  def row2()
    "| 3) [Update samples]         | 4) [Update sources]      |\n"
  end
  
  def row3()
    "| 5) [Import samples]         | 6) [Import sources]      |\n"
  end
  
  def row4()
    "| 7) [Import sample groups]   |                          |\n"
  end
  
  def row5()
    "| t) [Take samples out]       | p) [Put samples in]      |\n"
  end
  
  def row6()
    "| d) [Delete vials]           | u) [Upload file UDF]     |\n"
  end
  
  def row7()
    "|                   s) [Byt server]                      |\n"
  end
  
  def back_quit_footer()  
    "|          B) Bakåt           |          Q) Quit         |\n"
  end

  def quit_footer()  
    "|                         Q) Quit                        |\n"
  end
  
  def print_header1()  
    "|      ~~~~~~~~~~~~~~ [ UBB FP API ] ~~~~~~~~~~~~~~      |\n"
  end
  
  def print_header2()  
    "|              FreezerPro funktionsbibliotek             |\n"
  end
  
  def print_header3()  
    "|      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      |\n"
  end    
  
  def selected_server()
    "|                      Vald server:                      |\n"
  end
  
  def currently_selected_server()  
    $menu_print
  end

  def enter_username()
    "|                      Enter username:                   |\n"
  end

  def current_username()
    "|                      Username:                         |\n"
  end

  def enter_password()
    "|                      Enter password:                   |\n"
  end

  def whitespace()
    "|                                                        |\n"
  end
end