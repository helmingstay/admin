## 2025-11: panax: used Thinkpad p15 gen 3
* 2025-11
    - initial setup, install debian 13 w/xfce
    - upgrade to testing, install basic devtools
* 2025-11-17
    - get admin repo, install firefox
    - config panel
* 2025-11-18
    - add autostart: `xfce4-session-settings`, see `.config/autostart`
        - fix keyboard: `/usr/bin/setxkbmap -option "ctrl:nocaps"`
        - add gnome-terminal

## 2026-01-26
* cercis crash, migrate firefox profile over
    - firefox -ProfileManager
* update Appearance font size (menu)
* set swappiness
    - `sudo sysctl vm.swappiness=20`

## 2026-02-19
* system crash on dock plugin
    - `sudo adduser xian adm`
    - inspect previous boot: `sudo journalctl -b-1`
    - find hardware: `lspci | less`
    - https://www.notebookcheck.net/NVIDIA-Quadro-T1000-Laptop-Graphics-Card.423972.0.html
* nvidia drivers
    - ref: https://wiki.debian.org/NvidiaGraphicsDrivers
    - add non-free to /etc/apt/sources.list
    - `sudo apt install nvidia-detect`
    - `sudo  apt install nvidia-open-kernel-dkms nvidia-driver`
    - reboot

## 2026-02-22
* termal alignment viewer to ~/local/bin
    - https://github.com/sib-swiss/termal/releases/tag/v1.3.0

## 2026-03-03
* Weird touchpad behavior in zoom
    - Settings -> Mouse and Touchpad -> Devices: disable Wacom
    - Ref: use xinput to inspect: https://askubuntu.com/questions/262754/how-do-i-disable-double-click-drag-in-ubuntu

## 2026-03-...
* Battery issues
    - charge-pending: `upower -i /org/freedesktop/UPower/devices/battery_BAT0`
* Fan issues
