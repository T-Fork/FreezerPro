class Upload
def upload_file()
    filename = IO.popen("")
    file = File.join(Dir.pwd, filename)
      puts f.readlines 
end
# eller detta kan vara vettigt

def openFile()
  file = filedialog.askopenfile(parent=main_window, mode='rb', title='Select a file')
  contents = file.read()
  file.close()
end
# tk dialog windows
require 'tk'
filename = Tk::getOpenFile
filename = Tk::getSaveFile
dirname = Tk::chooseDirectory

  #https://www.tutorialspoint.com/ruby/ruby_tk_dialogbox.htm
  #https://pythonspot.com/tk-file-dialogs/
  #https://tkdocs.com/tutorial/windows.html
end