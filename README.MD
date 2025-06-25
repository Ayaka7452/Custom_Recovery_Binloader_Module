# What is This
This is a binloader module that enables user to use custom recovery image with avb and userdata encrypted
# Detail
For my device (Samsung S23 Ultra), the avb restores the custom recovery to stock ones automatically if user flashes the custom recovery to slot. And the latest twrp recovery cannot decrypt userdata, even it has no lockscreen, so user cannot back their userdata up, and cannot use twrp stably.
# Solutions
## Common Solution
To solve this, a workable solution is to flash the AIO Script provided from XDA (Samsung Forum), this script disables the avb restoration and decrypts the userdata, make userdata can be read by twrp. But this will cause the risk of personal data leak, all sensitive data can be read via recovery.
## Solution by This Module
This module provided a other way to use twrp recovery, and enables user to backup and restore userdata.
```
(1) Requirements:
1. Bootloader is unlocked
2. Device has root access
3. Terminal emulator APP (eg. Termux)
4. Workable TWRP image for your device
(2) Installation:
1. Download the lastest tar file from release
2. Flash it to system using command: bpkg install /path/to/file/crec.tar
3. Place your custom_recovery.img to moddir (/data/binloader/mods/Custom_Rec)
4. Reboot device
5. Execute: crec once to make it initized
(3) Usage:
1. To use twrp, type command: crec flash. You should flash it everytime you uses the twrp.
2. To reboot to recovery, type command: crec reboot-rec
3. To backup restore data, deploy rescue kit: crec instrk
```
# Data Backup Restore
To perform backup and restore:
```
(1) Requirements:
1. Module is installed and rescue kit is deployed
2. Mass storage device and OTG cable
3. Space of storage device is larger than used space of userdata
(2) Steps:
1. Flash and reboot into TWRP
2. Plug OTG device in, mount OTG and Cache
3. Open TWRP Terminal, type: /cache/rescue/otg-backup , then userdata will be dumped to OTG device, backup completed
4. Open TWRP Terminal, type: /cache/rescue/otg-restore , then userdata will be restored from OTG device, restore completed
5. Notice: after restore, the root access may lost, should reflash boot.img or init_boot.img to restore it
```
# Advantages and Disadvantages
```
(1) Advantages: keep encrypted, no twrp access unless lockscreen unlocked, protect privacy
(2) Disadvantages: require more technique knowledge
```
# Disclaimer
The author does NOT have copyright of dd utility and its libraries, only provided binaries in release for convenient.
The author (Ayaka7452) is NOT responsible for any data losses or any device damage or any malfunction and its consequence caused by using this module.
If you use it, then it means you accepted these terms.
