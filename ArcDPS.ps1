﻿# Determines if Backups are preset, if TRUE delete and rename the current DLLs to .bak and then download the new DLL

# Must set path to where your bin64 folder is located
$ArcDPS = "\Guild Wars 2\bin64\d3d9.dll"
$ArcDPS_Restricted = "\Guild Wars 2\bin64\d3d9_arcdps_restricted.dll"
$Success = "ArcDPS has successfully updated"
$Failure = "ArcDPS has failed to update"

$ArcDPS_Backup = "s\Guild Wars 2\bin64\d3d9.dll.bak"
$ArcDPS_Restricted_Backup = "s\Guild Wars 2\bin64\d3d9_arcdps_restricted.dll.bak"
$Restricted_Success = "ArcDPS Restricted has successfully updated"
$Restricted_Failure = "ArcDPS Restricted has failed to update"

# Test-Path and Remove-Item Variables
$TestPath_ArcDPS_Backup = Test-Path $ArcDPS
$TestPath_ArcDPS_Restricted_Backup = Test-Path $ArcDPS_Restricted

# Test if D3D9.DLL backup exists. If TRUE, remove backup, create new backup, download new DLL.
If ($TestPath_ArcDPS_Backup -eq $True) {
    Remove-Item -Path $ArcDPS_backup 
    Rename-Item $ArcDPS $ArcDPS_Backup 
    Invoke-WebRequest "http://www.deltaconnected.com/arcdps/x64/d3d9.dll" -OutFile $ArcDPS
    Write-Host $Success
}
# Assums this is a first time installation of ArcDPS with no backup present.
Else {
        If ($TestPath_ArcDPS_Backup -eq $False) { 
            Invoke-WebRequest "http://www.deltaconnected.com/arcdps/x64/d3d9.dll" -OutFile $ArcDPS
            Write-Host $Restricted_Success
        }
}

# Test if D3D9_ARCDPS_RESTRICTED.DLL.BAK exists
If ($TestPath_ArcDPS_Restricted_Backup -eq $True) {
    Remove-Item -Path $ArcDPS_Restricted_Backup 
    Rename-Item $ArcDPS_Restricted $ArcDPS_Restricted_Backup  
    Invoke-WebRequest "http://www.deltaconnected.com/arcdps/x64/the%20forbidden%20fruit/by%20eating%20you%20accept%20all%20consequences/strictly%20not%20allowed%20by%20arenanet/only%20harmess%20qol/d3d9_arcdps_restricted.dll" -OutFile $ArcDPS_Restricted
    Write-Host $Restricted_Success
}
# Assums this is a first time installation of ArcDPS with no backup present.
Else {
        If ($TestPath_ArcDPS_Restricted_Backup -eq $False) { 
            Invoke-WebRequest "http://www.deltaconnected.com/arcdps/x64/the%20forbidden%20fruit/by%20eating%20you%20accept%20all%20consequences/strictly%20not%20allowed%20by%20arenanet/only%20harmess%20qol/d3d9_arcdps_restricted.dll" -OutFile $ArcDPS_Restricted
            Write-Host $Restricted_Success
        }
}
