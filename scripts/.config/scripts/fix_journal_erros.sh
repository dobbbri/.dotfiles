#!/bin/bash

fix_b43_wireless_driver_error() {
  cat <<EOF >/etc/modprobe.d/local-b43.conf
# Activate experimental support for some hardware revisions
options b43 allhwsupport=1
EOF

  sudo rmmod b43
  sudo modprobe b43
  sudo apt install firmware-b43-installer
}

fix_xdg_desktop_portal_error() {
  sudo apt remove xdg-desktop-portal
}

fix_alsa_restore_std_boot_error() {
  echo '
to fix in 90-alsa-restore.rules.in not found LABEL="alsa_restore_std":
sudo vim /usr/lib/udev/rules.d/90-alsa-restore.rules
in line 26: 
replace a label alsa_restore_go to alsa_restore_std 
save and reboot'
}
