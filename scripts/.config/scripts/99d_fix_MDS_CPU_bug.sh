#!/bin/bash

# https://askubuntu.com/questions/1250040/how-do-i-fix-mds-cpu-bug-present-and-smt-on-data-leak-possible-errors-from-lo

echo "run script manually one by one ------------------------------"
exit

fix_mds_cpu_bug_present_and_smt_on_data_leak() {

  # Disables MDS mitigations completely.
  sudo -H nvim /etc/default/grub

  # Change:
  GRUB_CMDLINE_LINUX_DEFAULT="quiet"

  # To:
  GRUB_CMDLINE_LINUX_DEFAULT="quiet splash mds=full,nosmt"

  # Save the file and quit gedit.
  sudo update-grub

  # reboot
}
