Write-Host "Pinging IPs"
$name = Get-ADDomain | Select -ExpandProperty NetBIOSName
$ping= New-Object System.Net.Networkinformation.Ping
8..50 | % { $ping.send(“192.168.1.$_”) | select address, status | where status -Match "success"
 } | ft -hidetableheader > output.txt
"Server     " + $name >> output.txt