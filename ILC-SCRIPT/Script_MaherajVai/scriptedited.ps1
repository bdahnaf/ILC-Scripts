$computers = Get-ADComputer -Filter *
$out = foreach ($computer in $Computers) {
    New-Object -TypeName PSObject -Property @{
        
        DistinguishedName = $Computer.DistinguishedName
        DNSHostName = $Computer.DNSHostName
        Enabled = $Computer.Enabled
        Name = $Computer.Name
        SID = $Computer.SID
        Status = Test-Connection -CN $Computer.DNSHostName -Count 1 -BufferSize 16 -Quiet
	NetBIOSName = $Computer.NetBIOSName

  } 
}
$out >> output.txt