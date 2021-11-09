param(
[bool]$wsa,
[bool]$gapps,
[bool]$vmc
)
    $wsaint = [int][bool]::Parse($wsa)
    $gappsint = [int][bool]::Parse($gapps)
    $vmcint = [int][bool]::Parse($vmc)

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-ExecutionPolicy Bypass `"$PSCommandPath`" $wsaint $gappsint $vmcint " -Verb RunAs; exit }

$Arch = ($env:PROCESSOR_ARCHITECTURE)

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
    $wsafolder = 'C:\wsa'
if (Test-Path -Path $wsafolder) {
   Write-Host "I found folder named wsa."
} else {
    mkdir "C:\wsa"
}
$wsaprojectfolderr = 'C:\wsaproject'
if (Test-Path -Path $wsaprojectfolderr) {
   Write-Host "I found folder named wsaproject."
} else {
    mkdir "C:\wsaproject"
}

$wsaprojectfolderr = 'C:\wsaproject\microsoftwsa'
if (Test-Path -Path $wsaprojectfolderr) {
   Write-Host "I found folder named microsoftwsa and delete."
   Remove-Item -Path C:\wsaproject\microsoftwsa\ -Force -Recurse
} else {
}
$wsaprojectfolderr = 'C:\wsa\x64'
if (Test-Path -Path $wsaprojectfolderr) {
   Write-Host "I found folder named wsa and delete."
   Remove-Item -Path C:\wsa\x64 -Force -Recurse
} else {
}
Clear-Host
    if ($vmcint) {
        dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
        Clear-Host
    }
    if ($wsaint -and $gappsint) {
         wsl -d openSUSE-Tumbleweed -e sudo sh -c "cd ~ && sudo zypper ref && sudo zypper dup -y && sudo zypper in -y git curl wget lzip unzip e2fsprogs python38 python38-pip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/1.0.1/setup.sh -O setup.sh && sudo chmod +x ./setup.sh && sudo ./setup.sh --wsa --gapps --all-okey"
    }
    elseif ($wsaint)
    {
         wsl -d openSUSE-Tumbleweed -e sudo sh -c "cd ~ && sudo zypper ref && sudo zypper dup -y && sudo zypper in -y git curl wget lzip unzip e2fsprogs python38 python38-pip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/1.0.1/setup.sh -O setup.sh && sudo chmod +x ./setup.sh && sudo ./setup.sh --wsa --all-okey"
    }
    elseif ($gappsint)
    {
         wsl -d openSUSE-Tumbleweed -e sudo sh -c "cd ~ && sudo zypper ref && sudo zypper dup -y && sudo zypper in -y git curl wget lzip unzip e2fsprogs python38 python38-pip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/1.0.1/setup.sh -O setup.sh && sudo chmod +x ./setup.sh && sudo ./setup.sh --gapps --all-okey"
    }
    elseif (! $wsaint -or !$gappsint )
    {
        Write-Host "Make sure you have openSUSE Tumbleweed installed or it could cause problems if things go wrong. If not, please close the window directly."
        Pause
        Clear-Host
         wsl -d openSUSE-Tumbleweed -e sudo sh -c "cd ~ && sudo zypper ref && sudo zypper dup -y && sudo zypper in -y git curl wget lzip unzip e2fsprogs python38 python38-pip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/1.0.1/setup.sh -O setup.sh && sudo chmod +x ./setup.sh && sudo ./setup.sh --all-okey"
    }
 
    Set-Location "C:\wsaproject"
.\powershell.ps1

}
elseif ($Arch -eq 'Arm64') {
    Write-Host -Object 'Running 64-bit ARM PowerShell';
    $wsafolder = 'C:\wsa'
if (Test-Path -Path $wsafolder) {
   Write-Host "I found folder named wsa."
} else {
    mkdir "C:\wsa"
}
$wsaprojectfolderr = 'C:\wsaproject'
if (Test-Path -Path $wsaprojectfolderr) {
   Write-Host "I found folder named wsaproject."
} else {
    mkdir "C:\wsaproject"
}

$wsaprojectfolderr = 'C:\wsaproject\microsoftwsa'
if (Test-Path -Path $wsaprojectfolderr) {
   Write-Host "I found folder named microsoftwsa and delete."
   Remove-Item -Path C:\wsaproject\microsoftwsa\ -Force -Recurse
} else {
}
$wsaprojectfolderr = 'C:\wsa\arm64'
if (Test-Path -Path $wsaprojectfolderr) {
   Write-Host "I found folder named wsa and delete."
   Remove-Item -Path C:\wsa\arm64 -Force -Recurse
} else {
}
Clear-Host
    Write-Host "BETA SCRIPT"
    if ($vmc) {
        dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
        Clear-Host
    }
    if ($wsa -and $gapps) {
         wsl -d openSUSE-Tumbleweed -e sudo sh -c "cd ~ && sudo zypper ref && sudo zypper dup -y && sudo zypper in -y git curl wget lzip unzip e2fsprogs python38 python38-pip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/1.0.1/setup-arm.sh -O setup-arm.sh && sudo chmod +x ./setup-arm.sh && sudo ./setup-arm.sh --wsa --gapps --all-okey"
    }
    elseif ($wsa)
    {
         wsl -d openSUSE-Tumbleweed -e sudo sh -c "cd ~ && sudo zypper ref && sudo zypper dup -y && sudo zypper in -y git curl wget lzip unzip e2fsprogs python38 python38-pip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/1.0.1/setup-arm.sh -O setup-arm.sh && sudo chmod +x ./setup-arm.sh && sudo ./setup-arm.sh --wsa --all-okey"
    }
    elseif ($gapps)
    {
         wsl -d openSUSE-Tumbleweed -e sudo sh -c "cd ~ && sudo zypper ref && sudo zypper dup -y && sudo zypper in -y git curl wget lzip unzip e2fsprogs python38 python38-pip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/1.0.1/setup-arm.sh -O setup-arm.sh && sudo chmod +x ./setup-arm.sh && sudo ./setup-arm.sh --gapps --all-okey"
    }
    elseif (! $wsaint -or !$gappsint )
    {
        Write-Host "Make sure you have openSUSE Tumbleweed installed or it could cause problems if things go wrong. If not, please close the window directly."
        Pause
        Clear-Host
         wsl -d openSUSE-Tumbleweed -e sudo sh -c "cd ~ && sudo zypper ref && sudo zypper dup -y && sudo zypper in -y git curl wget lzip unzip e2fsprogs python38 python38-pip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/1.0.1/setup-arm.sh -O setup-arm.sh && sudo chmod +x ./setup-arm.sh && sudo ./setup-arm.sh --all-okey"
    }
    
    Set-Location "C:\wsaproject"
.\powershell.ps1
}