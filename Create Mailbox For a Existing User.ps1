Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force 

$LiveCred = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri  -Authentication Kerberos -Credential $LiveCred 
Import-PSSession $Session -DisableNameChecking 

$EmailAddress = Read-Host 'Enter the NEW Email Address of the user'

Get-user "$EmailAddress" | Enable-Mailbox 

Remove-PSSession $Session 

