$name = Get-ADDomain | Select -ExpandProperty NetBIOSName
.\logonHistory.ps1 -MaxEvent 500 -LastLogonOnly -OuOnly | Export-Csv -NoTypeInformation "C:\Users\Administrator\Desktop\schedule\$name.csv"
