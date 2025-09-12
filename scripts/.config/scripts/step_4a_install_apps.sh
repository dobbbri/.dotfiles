#!/bin/bash

# ========================================
# Script Banner and Intro
# ========================================
clear
echo "
 +-+-+-+-+-+-+-+-+-+-+-+-+-+
 |s|e|r|g|i|o| | |d|o|b|r|i|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+
 |i|n|s|t|a|l| |s|c|r|i|p|t|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+
"

# ========================================
# Package Installation Section
# ========================================
install_packages() {
  echo "Installing required packages..."
  sudo apt install -y xorg xorg-dev alacritty \
    xbacklight xbindkeys xinput hsetroot brightnessctl \
    network-manager thunar thunar-archive-plugin thunar-volman lxappearance dialog acpi acpid \
    gvfs-backends feh fonts-recommended fonts-font-awesome fonts-terminus \
    eza flameshot qimgv libnotify-bin xdotool unzip libnotify-dev firefox-esr geany \
    gparted htop alsa-utils color-picker mintstick atril \
    transmission feh xarchiver curl unzip ssh-askpass wget stow \
    lxtask fzf papirus-icon-theme heif-gdk-pixbuf webp-pixbuf-loader \
    xdg-user-dirs-gtk || echo "Warning: Package installation failed."
  echo "Package installation completed."
}

install_reqs() {
  echo "Updating package lists and installing required dependencies..."
  sudo apt install -y build-essential cmake meson ninja-build wget pkg-config || {
    echo "Package installation failed."
    exit 1
  }
}

install_laptop_packages() {
  echo "Optimize Linux Laptop Battery Life and thermal changes"
  # sudo apt install -y tlp tlp-rdw smartmontools acpi-support acpi-call-dkms thermald
  echo "Package installation completed."
}

fix_and_remove_packages() {
  echo "-Enable/Fix tap to click"
  sudo apt remove --yes xserver-xorg-input-synaptics
  sudo apt install --yes xserver-xorg-input-libinput
  sudo cp /home/sdobri/.dotfiles/scripts/.config/scripts/config/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

  echo "Remove geoclue-2.0(redshift) services"
  #  sudo apt --purge --yes autoremove geoclue-2.0

  echo "remove modemmanager"
  sudo apt --purge --yes autoremove modemmanager

  echo "Remove printer services"
  sudo apt --purge --yes autoremove cups system-config-printer simple-scan

  echo "Remove bluetooth services"
  sudo apt --purge --yes autoremove blueman bluez-utils bluez bluetooth

  echo "Remove xdg-desktop-portal for flatpack and snap"
  sudo apt --purge --yes xdg-desktop-portal
}

# ========================================
# Enabling Required Services
# ========================================
# Enables system services such asavahi-daemon and ACPI
# ------------------------------------------------
# This section ensures that necessary services like Avahi (for network discovery)
# and ACPI (for power management) are enabled on the system for proper operation.
enable_services() {
  echo "Enabling required services..."
  # sudo systemctl enable acpid || echo "Warning: Failed to enable acpid."

  # sudo tlp start

}

# ========================================
# User Directory Setup
# ========================================
# Sets up user directories (e.g., Downloads, Music, Pictures) and creates
# a Screenshots folder for easy screenshot management
# ---------------------------------------------------------------
# This section updates the user directories (such as `Downloads` or `Documents`)
# using the `xdg-user-dirs-update` utility. It also ensures a `Screenshots`
# directory exists in the user's home directory for managing screenshots.
setup_user_dirs() {
  echo "Updating user directories..."
  xdg-user-dirs-update || echo "Warning: Failed to update user directories."
  mkdir -p ~/Screenshots/ || echo "Warning: Failed to create Screenshots directory."
  mkdir -p ~/Sites/ || echo "Warning: Failed to create Sites directory."
  mkdir -p ~/.nvm/ || echo "Warning: Failed to create .nvm directory."
  echo "User directories updated."
}

# ========================================
# Font Installation
# ========================================
# Installs a list of selected fonts for better terminal and GUI appearance
# ----------------------------------------------------------------------
# This section installs various fonts including `Nerd Fonts` from GitHub releases,
# and copies custom TTF fonts into the local fonts directory. It then rebuilds
# the font cache using `fc-cache`.
install_fonts() {
  echo "Installing fonts..."
  mkdir -p ~/.local/share/fonts
  fonts=("JetBrainsMono" "UbuntuSans" "AtkinsonHyperlegibleMono" "IntelOneMono" "NerdFontsSymbolsOnly")

  for font in "${fonts[@]}"; do
    if [ -d ~/.local/share/fonts/$font ]; then
      echo "Font $font is already installed. Skipping."
    else
      echo "Installing font: $font"
      wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/$font.zip" -P /tmp || {
        echo "Warning: Error downloading font $font."
        continue
      }
      unzip -q /tmp/$font.zip -d ~/.local/share/fonts/$font/ || echo "Warning: Error extracting font $font."
      rm /tmp/$font.zip
    fi
  done

  fc-cache -f || echo "Warning: Error rebuilding font cache."
  echo "Font installation completed."
}

# ========================================
# GTK Theme Settings
# ========================================

change_theming() {
  # Ensure the directories exist
  mkdir -p ~/.config/gtk-3.0

  # Write to ~/.config/gtk-3.0/settings.ini
  cat <<EOF >~/.config/gtk-3.0/settings.ini
[Settings]
gtk-theme-name=Yaru-Dark
gtk-icon-theme-name=Yaru-Dark
gtk-font-name=Sans 10
gtk-cursor-theme-name=Yaru
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull
EOF

  # Ensure the directories exist
  mkdir -p ~/.config/gtk-2.0

  # Write to ~/.gtkrc-2.0
  cat <<EOF >~/.config/gtk-2.0/.gtkrc-2.0
  gtk-theme-name=Yaru-Dark
  gtk-icon-theme-name=Yaru-Dark
  gtk-font-name="Sans 10"
  gtk-cursor-theme-name="Yaru"
  gtk-cursor-theme-size=0
  gtk-toolbar-style=GTK_TOOLBAR_BOTH
  gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
  gtk-button-images=1
  gtk-menu-images=1
  gtk-enable-event-sounds=1
  gtk-enable-input-feedback-sounds=1
  gtk-xft-antialias=1
  gtk-xft-hinting=1
  gtk-xft-hintstyle="hintfull"
  EOF
  echo "GTK settings updated."
}

# ========================================
# Power Off Key Settings
# ========================================

change_power_off_key() {
  sudo mv /etc/systemd/logind.conf /etc/systemd/logind.conf.bkp
  cat <<EOF >/etc/systemd/logind.conf
[Login]
#NAutoVTs=6
#ReserveVT=6
#KillUserProcesses=no
#KillOnlyUsers=
#KillExcludeUsers=root
#InhibitDelayMaxSec=5
#UserStopDelaySec=10
HandlePowerKey=suspend
HandlePowerKeyLongPress=poweroff
#HandleRebootKey=reboot
#HandleRebootKeyLongPress=poweroff
#HandleSuspendKey=suspend
#HandleSuspendKeyLongPress=hibernate
#HandleHibernateKey=hibernate
#HandleHibernateKeyLongPress=ignore
#HandleLidSwitch=suspend
#HandleLidSwitchExternalPower=suspend
#HandleLidSwitchDocked=ignore
#PowerKeyIgnoreInhibited=no
#SuspendKeyIgnoreInhibited=no
#HibernateKeyIgnoreInhibited=no
#LidSwitchIgnoreInhibited=yes
#RebootKeyIgnoreInhibited=no
#HoldoffTimeoutSec=30s
#IdleAction=ignore
#IdleActionSec=30min
#RuntimeDirectorySize=10%
#RuntimeDirectoryInodesMax=
#RemoveIPC=yes
#InhibitorsMax=8192
#SessionsMax=8192
#StopIdleSessionSec=infinity
EOF

  echo "Power Off Key set. Needs Reboot"
}

# ========================================
# Main Script Execution
# ========================================
echo "Starting installation process..."

install_packages
install_reqs
#install_laptop_packages
#enable_services
setup_user_dirs
install_fonts
fix_and_remove_packages
change_theming
#change_power_off_key

echo "All installations completed successfully!"
