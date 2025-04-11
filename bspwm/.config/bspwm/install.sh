#!/bin/bash

# ========================================
# Script Banner and Intro
# ========================================
clear
echo "
 +-+-+-+-+-+-+-+-+-+-+-+-+-+ 
 |s|e|r|g|i|o| | |d|o|b|r|i| 
 +-+-+-+-+-+-+-+-+-+-+-+-+-+ 
 |b|s|p|w|m| | |s|c|r|i|p|t|  
 +-+-+-+-+-+-+-+-+-+-+-+-+-+                                                                            
"

INSTALL_DIR="$HOME/installation"

# ========================================
# Initialization
#================================
mkdir -p "$INSTALL_DIR" || {
  echo "Failed to create installation directory."
  exit 1
}

# Cleanup function
cleanup() {
  rm -rf "$INSTALL_DIR"
  echo "Installation directory removed."
}
trap cleanup EXIT

# ========================================
# Package Installation Section
# ========================================
# Install required packages
install_packages() {
  echo "Installing required packages..."
  sudo apt install -y \
    xorg brightnessctl xinput build-essential bspwm sxhkd polybar \
    network-manager pamixer pcmanfm \
    file-roller lxappearance dialog \
    acpi acpid gvfs \
    feh fonts-recommended fonts-font-awesome yaru-theme-gtk yaru-theme-icon \
    papirus-icon-theme exa flameshot qimgv rofi dunst libnotify-bin xdotool unzip \
    libnotify-dev firefox-esr geany sakura \
    xdg-user-dirs-gtk redshift \
    gparted neofetch htop alsa-utils ristretto exa color-picker mintstick atril transmission feh\
    xarchiver curl dunst unzip ssh-askpass wget dconf-editor stow \
    fonts-noto-color-emoji lxtask fzf yaru-theme-gtk yaru-theme-icon \
    --no-install-recommends || echo "Warning: Package installation failed."
  echo "Package installation completed."
}



install_laptop_packages() {
  echo "Optimize Linux Laptop Battery Life and thermal changes"
  sudo apt install -y tlp tlp-rdw acpi-support acpi-call-dkms thermald
  echo "Package installation completed."
}

fix_and_remove_packages() {
  echo "-Enable/Fix tap to click"
  sudo apt remove --yes xserver-xorg-input-synaptics
  sudo apt install --yes xserver-xorg-input-libinput
  sudo cp /home/sdobri/.dotfiles/scripts/.config/scripts/config/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

  echo "Remove geoclue-2.0(redshift) services"
  sudo apt --purge --yes autoremove geoclue-2.0

  echo "remove modemmanager"
  sudo apt --purge --yes autoremove modemmanager

  echo "Remove printer services"
  sudo apt --purge --yes autoremove cups system-config-printer simple-scan

  echo "Remove bluetooth services"
  sudo apt --purge --yes autoremove blueman bluez-utils bluez bluetooth
}

# ========================================
# Enabling Required Services
# ========================================
# Enables system services such as Avahi and ACPI
# ------------------------------------------------
# This section ensures that necessary services like Avahi (for network discovery)
# and ACPI (for power management) are enabled on the system for proper operation.
enable_services() {
  echo "Enabling required services..."
  sudo systemctl enable acpid || echo "Warning: Failed to enable acpid."

  sudo tlp start

  # brightnessctl --list
  sudo brightnessctl --device='smc::kbd_backlight' set 30
  sudo brightnessctl --device='acpi_video0' set 2
  echo "Services enabled."
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
  echo "User directories updated."
}
# ========================================
# Utility Functions
# ========================================
command_exists() {
  command -v "$1" &>/dev/null
}

install_reqs() {
  echo "Updating package lists and installing required dependencies..."
  sudo apt install -y \
    build-essential cmake meson ninja-build git wget curl \
    libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev \
    libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev \
    libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev \
    libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev \
    libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev \
    libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev \
    libxcb-xfixes0-dev libxext-dev uthash-dev \
    libgtk-4-dev libadwaita-1-dev \
    pkg-config || {
    echo "Package installation failed."
    exit 1
  }
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
  fonts=("JetBrainsMono" "RobotoMono" "SourceCodePro" "UbuntuSans" "Meslo")

  for font in "${fonts[@]}"; do
    if [ -d ~/.local/share/fonts/$font ]; then
      echo "Font $font is already installed. Skipping."
    else
      echo "Installing font: $font"
      wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/$font.zip" -P /tmp || {
        echo "Warning: Error downloading font $font."
        continue
      }
      unzip -q /tmp/$font.zip -d ~/.local/share/fonts/$font/ || echo "Warning: Error extracting font $font."
      rm /tmp/$font.zip
    fi
  done

  # Add custom TTF fonts
  cp ~/.config/bspwm/fonts/* ~/.local/share/fonts || echo "Warning: Error copying custom TTF fonts."
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
gtk-cursor-theme-name=Adwaita
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

  # Write to ~/.gtkrc-2.0
  cat <<EOF >~/.gtkrc-2.0
gtk-theme-name=Yaru-Dark
gtk-icon-theme-name=Yaru-Dark
gtk-font-name="Sans 10"
gtk-cursor-theme-name="Adwaita"
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


install_battery_alert(){
  curl -o- https://raw.githubusercontent.com/asapdotid/battery-alert-linux/refs/heads/main/install.sh | bash

 # Set Notification config file: /home/sdobri/.local/share/battery-alert/default.conf
 # Set executable file: /home/sdobri/.local/share/battery-alert/battery-alert.sh
 # Set user service: /home/sdobri/.config/systemd/user/battery-alert.service
 # Set user timer: /home/sdobri/.config/systemd/user/battery-alert.timer
}

# ========================================
# Main Script Execution
# ========================================
echo "Starting installation process..."

install_packages
install_laptop_packages
enable_services
setup_user_dirs
install_reqs
install_fonts
fix_and_remove_packages
change_theming
change_power_off_key
install_battery_alert

echo "All installations completed successfully!"
