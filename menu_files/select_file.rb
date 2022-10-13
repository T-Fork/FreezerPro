module Select_File
    def upload_file()
        filename = IO.popen("")
        file = File.join(Dir.pwd, filename)
            puts f.readlines

    end
    
    def openFile()
        file = filedialog.askopenfile(parent=main_window, mode='rb', title='Select a file')
        contents = file.read()
        file.close()
      end
    
    def File_with_WIN32()
        require "win32ole"

        cd = WIN32OLE.new("MSComDlg.CommonDialog")

        cd.filter = "All Files(*.*)|*.*" +"|Ruby Files(*.rb)|*.rb"
        cd.filterIndex = 2

        cd.maxFileSize = 128    # Set MaxFileSize

        cd.showOpen()

        file = cd.fileName      # Retrieve file, path

        if not file or file==""
           puts "No file selected."
        else
           puts "Selected file: #{file}\n"
        end
    end
    
    def File_with_tk() #tk refuses to install on UBB-AP-01
        require 'tk'
        root = TkRoot.new
        root.title = "Window"
        button_click = Proc.new {
           Tk.getOpenFile
        }
        button = TkButton.new(root) do
           text "button"
           pack("side" => "left",  "padx"=> "50", "pady"=> "50")
        end
        button.comman = button_click
        Tk.mainloop
    end
end
