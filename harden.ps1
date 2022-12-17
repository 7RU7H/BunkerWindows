# Enable firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Set firewall rule to block all inbound traffic by default
New-NetFirewallRule -DisplayName "Block all inbound traffic" -Direction Inbound -Action Block -Enabled True

# Enable Windows Defender
Set-MpPreference -DisableRealtimeMonitoring $false

# Enable automatic updates
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 0

# Enable user account control
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 1

# Set password complexity requirements
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Network\PasswordComplexity" -Name "PasswordComplexity" -Value 1

# Set password length requirements
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Network" -Name "MinimumPasswordLength" -Value 8

# Set password age requirements
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Network" -Name "MaximumPasswordAge" -Value 90

# Enable auditing
Set-ItemProperty -Path "HKLM:\Security\Policy\PolAdtEv" -Name "AuditPolicyChange" -Value 1
Set-ItemProperty -Path "HKLM:\Security\Policy\PolAdtEv" -Name "AuditAccountLogon" -Value 1
Set-ItemProperty -Path "HKLM:\Security\Policy\PolAdtEv" -Name "AuditAccountManage" -Value 1
Set-ItemProperty -Path "HKLM:\Security\Policy\PolAdtEv" -Name "AuditDSAccess" -Value 1
Set-ItemProperty -Path "HKLM:\Security\Policy\PolAdtEv" -Name "AuditObjectAccess" -Value 1
Set-ItemProperty -Path "HKLM:\Security\Policy\PolAdtEv" -Name "AuditPolicyChange" -Value 1
Set-ItemProperty -Path "HKLM:\Security\Policy\PolAdtEv" -Name "AuditPrivilegeUse" -Value 1
Set-ItemProperty -Path "HKLM:\Security\Policy\PolAdtEv" -Name "AuditProcessTracking" -Value 1
Set-ItemProperty -Path "HKLM:\Security\Policy\PolAdtEv" -Name "AuditSystemEvents" -Value 1

# Enable AppLocker
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
Import-Module AppLocker
Get-AppLockerPolicy -Effective | Set-AppLockerPolicy

# Enable Secure Boot
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\SecureBoot\State" -Name "UEFISecureBootEnabled" -Value 1

# Disable Remote Desktop Protocol (RDP)
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 1
