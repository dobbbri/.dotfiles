sudo apt install -y brightnessctl
sudo brightnessctl --device='smc::kbd_backlight' set 30
sudo brightnessctl --device='acpi_video0' set 2

sudo usermod -a -G adm sd
sudo usermod -a -G systemd-journal sd
