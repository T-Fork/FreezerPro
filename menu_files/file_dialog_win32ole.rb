require 'win32ole'

fso = ::WIN32OLE.new("Scripting.FileSystemObject")
Call OpenFileDialog() #'select source file
SourceFileLocation = sFileSelected
DirPath = sFileSelected
FileDestination = DirPath & "-" & Date & "-export_med_region.csv"

Set objRead = objFSO.OpenTextFile(SourceFileLocation, 1, False)
objRead.SkipLine #'skip first line in file since it contains column headers
SourceFileContent = objRead.ReadAll #' Read file
objRead.Close
SourceFileContentToArray = Split(SourceFileContent, vbLf) #'split creates a one dimensional array


Sub OpenFileDialog()
	Set wShell=CreateObject("WScript.Shell")
	Set oExec=wShell.Exec("mshta.exe ""about:<input type=file id=FILE><script>FILE.click();new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);close();resizeTo(0,0);</script>""")
	sFileSelected = oExec.StdOut.ReadLine
End Sub

=begin
dialog = WIN32OLE.new("System.Windows.Forms.FileDialog")

dialog.filter = "All Files(*.*)|*.*" +"|Ruby Files(*.rb)|*.rb"
dialog.filterIndex = 2

dialog.maxFileSize = 128    # Set MaxFileSize

dialog.showOpen()

file = dialog.fileName      # Retrieve file, path

if not file or file==""
   puts "No filename entered."
else
   puts "The user selected: #{file}\n"
end
=end

