Write-Host "Pinging IPs"
#$name = Get-ADDomain | Select -ExpandProperty NetBIOSName
$ping = New-Object System.Net.Networkinformation.Ping
1..4 | % { $ping.send(“10.0.0.$_”) | select address, status
 }  | Export-Csv -NoTypeInformation -Delimiter "," output.txt | % {$_ -replace '"',''}  
#"Server     " + $name >> output.txt