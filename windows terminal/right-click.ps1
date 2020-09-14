$terminal_text = Get-Content ".\terminal.reg"
$terminal_text.Replace("[user_name]",$env:UserName) | Out-File ./_terminal.reg
reg import ./_terminal.reg
rm ./_terminal.reg
