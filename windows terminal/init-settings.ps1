mkdir "$env:LOCALAPPDATA\terminal"
Copy-Item -Path .\img\* -Destination $env:LOCALAPPDATA\terminal  -Recurse

$begin_path = pwd
$after_path = -Join($env:LOCALAPPDATA, "\Packages\Microsoft.WindowsTerminal_*\LocalState\")
cd $after_path
Copy-Item $begin_path\settings.json .\
cd $begin_path



