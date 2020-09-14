
mkdir "$env:LOCALAPPDATA\terminal"
Copy-Item -Path .\img -Destination $env:LOCALAPPDATA\terminal  -Recurse

$terminal_text = Get-Content ".\terminal.reg"
$terminal_text.Replace("[user_name]",$env:UserName) | Out-File ./_terminal.reg


