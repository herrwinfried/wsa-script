if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$Arch = (Get-Process -Id $PID).StartInfo.EnvironmentVariables["PROCESSOR_ARCHITECTURE"];
if ($Arch -eq 'x86') {
    Write-Host -Object 'Running 32-bit PowerShell';
    Write-Host -Object 'Sorry I dont support 32 bit.';
}
elseif ($Arch -eq 'Arm32') {
    Write-Host -Object 'Running 32-bit arm PowerShell';
    Write-Host -Object 'Sorry I dont support 32 bit.';
}
elseif ($Arch -eq 'amd64') {
    Write-Host -Object 'Running 64-bit PowerShell';
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    Write-Host "Make sure you have Ubuntu(ubuntu without version number) installed or it could cause problems if things go wrong. If not, please close the window directly."
Pause
wsl -d ubuntu -e sudo sh -c "cd ~ && sudo apt update && sudo apt upgrade -y && sudo apt install -y unzip lzip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/main/setup.sh -O setup.sh && sudo chmod +x ./setup.sh && sudo ./setup.sh"
cd "C:\wsaproject"
.\powershell.ps1

}
elseif ($Arch -eq 'Arm64') {
    Write-Host -Object 'Running 64-bit ARM PowerShell';
    Write-Host "BETA SCRIPT"
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    Write-Host "Make sure you have Ubuntu(ubuntu without version number) installed or it could cause problems if things go wrong. If not, please close the window directly."
Pause
wsl -d ubuntu -e sudo sh -c "cd ~ && sudo apt update && sudo apt upgrade -y && sudo apt install -y unzip lzip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/main/setup.sh -O setup.sh && sudo chmod +x ./setup.sh && sudo ./setup.sh"
cd "C:\wsaproject"
.\powershell.ps1
}