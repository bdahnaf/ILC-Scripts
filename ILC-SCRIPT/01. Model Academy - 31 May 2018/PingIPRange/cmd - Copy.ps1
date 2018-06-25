Write-Host "Pinging IPs"
$name = Get-ADDomain | Select -ExpandProperty NetBIOSName
$ping = New-Object System.Net.Networkinformation.Ping
1..30 | % { $ping.send(“10.0.0.$_”) | select address, status
 } | ft -hidetableheaders > output.txt
"Server     " + $name >> output.txt