# init copy static file
IF(Test-Path "$env:USERPROFILE\.moe\terminal")
{
    Remove-Item -force -recurse "$env:USERPROFILE\.moe\terminal"
}
Copy-Item -Path .\img\* -Destination $env:USERPROFILE\.moe\terminal  -Recurse

# replace windows terminal setting 
Copy-Item .\settings.json "$env:LOCALAPPDATA\Microsoft\Windows Terminal"

# add right click
#reg import .\terminal.reg
New-Item -Force -Path Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt
New-Item -Force -Path Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt\command
New-ItemProperty -Force -Path Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt "(default)"  -value "Terminal here" -PropertyType string
New-ItemProperty -Force -Path Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt "Icon"  -value "%USERPROFILE%\.moe\terminal\wt_32.ico" -PropertyType string
New-ItemProperty -Force -Path Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt\command "(default)"  -value "D:\\Applications\\Scoop\\shims\\wt.exe"  -PropertyType string

  



