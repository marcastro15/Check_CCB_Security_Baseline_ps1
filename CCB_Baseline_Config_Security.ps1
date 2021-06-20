clear
Write-Output "---"
Write-Output "NOTE: Run the command to set the policy"
Write-Output ""Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass"
Write-Output ""---"

#-------------------------MONITOR-----------------------------------------------------------------
Write-Output "---START SCANNING---"
Write-Output "MONITOR: Are these approved devices"
#During Cybersecurity Assessment process, assessors conduct investigations on desktops or servers owned by Information Security Department. 
#To make the job a lot faster, they run a scripts.

#all these event logs must be stored in the centralized log like Logrithm, Splut etc.
Write-Output "`n`n"
Write-Output "MONITOR: List parameter to display the available logs."
Write-Output "Check event logs configurations to ensure it's running..."
Get-EventLog -List

#List most recent entries in the event logs
Write-Output "`n`n"
Write-Output "MONITOR: List most recent entries of event logs."
$Events = Get-EventLog -LogName System -Newest 1000
$Events | Group-Object -Property Source -NoElement | Sort-Object -Property Count -Descending

#Get Error event
Write-Output "`n`n"
Write-Output "MONITOR: Get Error Events"
Get-EventLog -LogName System -EntryType Error

#View Network Sharing
Write-Output "`n`n"
Write-Output "What this client is sharing...?"
net share


#------------------------------PROTECT----------------------------------------------------------------------

#List all devices in the systems
Write-Output "`n`n"
gwmi Win32_USBControllerDevice -computername Coke |fl Antecedent,Dependent
#Check for Anti-Virus
Write-Output "`n`n"
Write-Output "PROTECT: Query the presense of Ant-Virus"
$wmiQuery = "SELECT * FROM AntiVirusProduct"
$AntivirusProduct = Get-WmiObject -Namespace "root\SecurityCenter2" -Query $wmiQuery  @psboundparameters # -ErrorVariable myError -ErrorAction 'SilentlyContinue'             
            Write-host $AntivirusProduct.displayName
#Check for HD/SSD Encryption
Write-Output "`n`n"
Write-Output "PROTECT: Check for encryption"
Get-BitLockerVolume 

#Check for hotfix
#Hotfix for multiple computer: Get-HotFix -Description Security* -ComputerName Server01, Server02 -Credential Domain01\admin01
Write-Output "`n`n"
Write-Output "Don't update vendors computer. Just check its latest update it complies with security policy in place"
Write-Output "PROTECT: Get all hotfixes on the local computer"
Get-HotFix

#Get the most hotfix on the local computer
Write-Output "PROTECT: What is the most recent hotfix?"
(Get-HotFix | Sort-Object -Property InstalledOn)[-1]

#----------------------------------CONTROL-------------------------------------------------------------------
#check for execution policy
Write-Output "Find out what execution policy of the local computer or server..."
Get-ExecutionPolicy

#check for local administrators
Write-Output "CONTROL: Check for local administrators to compare against their DB - JIRA"
Get-LocalGroupMember -Group "Administrators"


#local, domain AD, MFA
#check for password policy 25 characters
Write-Output "`n`n"
Write-Output "CONTROL: Check for password length policy for local computer"
net accounts

#Am I part of the domain
Write-Output "`n`n"
Write-Output "CONTROL: Check if this computer is part of the domain."
if ((gwmi win32_computersystem).partofdomain -eq $true) {
    write-host -fore green "I am part of the domain. Good to Go!"
} else {
    write-host -fore red "Ooops, workgroup! I'm not part of the domain. This is a red flag. Check the DIB(s) policy."
}



#https://www.varonis.com/blog/practical-powershell-for-it-security-part-ii-file-access-analytics-faa/

