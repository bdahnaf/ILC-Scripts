$computers = Get-ADComputer -Filter *
$out = foreach ($computer in $Computers) {
    New-Object -TypeName PSObject -Property @{
        
        DistinguishedName = $Computer.DistinguishedName
        DNSHostName = $Computer.DNSHostName
        Enabled = $Computer.Enabled
        Name = $Computer.Name
        ObjectGUID = $Computer.ObjectGUID
        SamAccountName = $Computer.SamAccountName
        SID = $Computer.SID
        UserPrincipalName = $Computer.UserPrincipalName
        Status = Test-Connection -CN $Computer.DNSHostName -Count 1 -BufferSize 16 -Quiet

  } 
}
$out