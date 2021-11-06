I created my project just to make it easy for you to install. It provides further simplification of installation using Project named "[WSAGAScript](https://github.com/WSA-Community/WSAGAScript)".
ADB won't load. You need to install [platform-tools](https://developer.android.com/studio/releases/platform-tools) yourself.
**This script will provide you with experimental WSA. Do it to the best of your knowledge. Also, you won't be getting any updates. (MS Store)**

> **I added a new script for arm, but I couldn't test whether it works fully, don't forget to give feedback as I don't have a device.**

## An amateur video showing the installation

[![q_yd7DohKQA](https://img.youtube.com/vi/NAEF_S1JTFk/0.jpg)](https://www.youtube.com/watch?v=NAEF_S1JTFk)

https://youtu.be/NAEF_S1JTFk

# Things to do before installation

- Windows 11
- [Ubuntu WSL](https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6) **You need to Activate [WSL](https://aka.ms/wslstorepage) also to use ubuntu**
- [OpenGapps](https://opengapps.org/) | [What should I choose when installing opengapps](https://github.com/herrwinfried/wsa-script/blob/main/docs/opengapps.md)
- [WSA msixbundle file](https://github.com/herrwinfried/wsa-script/blob/main/docs/wsamsixbundle.md)

## **Virtual Machine Platform must be active.**

> Open windows terminal as administrator. You can easily enable it by typing the following command. You should have enabled Ubuntu WSL when you installed it.
```
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

> You need to Activate [WSL](https://aka.ms/wslstorepage) also to use ubuntu

## Developer Mode must be turned on.
> Settings > Privacy & security > For Developers > Developer Mode
![image](https://user-images.githubusercontent.com/52379312/138754144-e81779ea-4c61-46c6-8860-6c39b33aab47.png)

__**IF YOU ARE USING WINDOWS TERMINAL, "Windows Powershell" MUST BE SELECTED. IT IS MORE LIKELY TO GET AN ERROR WITH POWERSHELL 7.**__
__**In normal use, you should prefer windows terminal instead of Powershell 7.**__

If there is a WSA installed, you need to uninstall it. 

## Putting WSA and opengapps in the right place

Place the downloaded opengapps and wsa file in the 'C:\wsaproject' directory as in the picture. Please do not play with filenames, it may prevent script execution.

![image](https://user-images.githubusercontent.com/52379312/138757705-8c89a573-71b2-40a0-b296-f87b666c0649.png)

If you are using regular **64 bit(amd64)** [click here.](#64-bit-you-need-to-run-the-script-on-ubuntuor-wsl-linux-distro)

If you are using **Arm64** [click here.](#beta-arm64-you-need-to-run-the-script-on-ubuntuor-wsl-linux-distro)

## [64 Bit] You need to run the script on Ubuntu(or WSL Linux Distro).

Ubuntu:
```
cd ~ && sudo apt update && sudo apt upgrade -y && sudo apt install -y unzip lzip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/beta/setup.sh -O setup.sh && sudo chmod +x ./setup.sh && sudo ./setup.sh
```
OpenSUSE Tumbleweed:
> It cannot be said that it was officially successful, I just found the necessary packages. But it didn't give me a problem.
```
cd ~ && sudo zypper ref && sudo zypper dup -y && sudo zypper in -y git curl wget lzip unzip e2fsprogs && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/beta/setup.sh -O setup.sh && sudo chmod +x ./setup.sh && sudo ./setup.sh
```

In Other Distros:
Be sure to install the following packages before running, as you have to install the missing packages yourself.
Packages that need to install their own script and WSAGAScript
- `unzip` (WSAGAScript)
- `lzip` (WSAGAScript)
- `lzip` (WSAGAScript)
- `git` (own script)
- `wget` (own script)
- `curl` (own script)
- `python3.8` (own script)
- `python3-pip` (own script)

and may require a few more unknown and basic packages.
```
cd ~ && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/main/setup.sh -O setup.sh && sudo chmod +x ./setup.sh && sudo ./setup.sh
```
[Go To "What to do after installation"](#what-to-do-after-installation)

## BETA [arm64] You need to run the script on Ubuntu(or WSL Linux Distro).

*still in beta*

Ubuntu:
```
cd ~ && sudo apt update && sudo apt upgrade -y && sudo apt install -y unzip lzip && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/main/setup_arm.sh -O setup_arm.sh && sudo chmod +x ./setup_arm.sh && sudo ./setup_arm.sh
```
OpenSUSE Tumbleweed:
```
cd ~ && sudo zypper ref && sudo zypper dup -y && sudo zypper in -y git curl wget lzip unzip e2fsprogs && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/main/setup_arm.sh -O setup_arm.sh && sudo chmod +x ./setup_arm.sh && sudo ./setup_arm.sh
```

In Other Distros:
Be sure to install the following packages before running, as you have to install the missing packages yourself.
Packages that need to install their own script and WSAGAScript
- `unzip` (WSAGAScript)
- `lzip` (WSAGAScript)
- `lzip` (WSAGAScript)
- `git` (own script)
- `wget` (own script)
- `curl` (own script)
- `python3.8` (own script)
- `python3-pip` (own script)

and may require a few more unknown and basic packages.
```
cd ~ && wget https://raw.githubusercontent.com/herrwinfried/wsa-script/main/setup_arm.sh -O setup_arm.sh && sudo chmod +x ./setup_arm.sh && sudo ./setup_arm.sh
```
[Go To "What to do after installation"](#what-to-do-after-installation)

## What to do after installation

In order for the powershell script in the "C:\wsaproject" directory to run, you need to change your permission setting. Below is the command you need to type. Run as Administrator Powershell.
Or Install manually. I talked about it below.

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```
we can run the script now!
![image](https://user-images.githubusercontent.com/52379312/138756336-feef2fd0-f697-401a-85d1-a243c9763e75.png)
The operation is successful when it is as in the picture. Red text should not necessarily be.

Making change permission default for Powershell
```
Set-ExecutionPolicy -ExecutionPolicy Restricted
```

or if you want to do it manually, start windows terminal administrator and type the following commands.

```
cd 'C:\wsaproject\microsoftwsa\wsa'
```

```
Add-AppxPackage -Register .\AppxManifest.xml
```
> In the past, it was necessary to connect adb and do something additional for google play, it is not needed anymore.