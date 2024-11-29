#!/bin/sh

# https://dwm.suckless.org/
# git clone https://github.com/torrinfail/dwmblocks ~/dotfiles/config/suckless/dwmblocks

echo "install ssh ------------------------------------------------------------"
# got to https://github.com/dobbbri/.ssh and Downloads repo as zip file
cd $HOME
unzip $HOME/Downloads/ssh-main.zip
mv $HOME/.ssh-main $HOME/.ssh
chmod 400 $HOME/.ssh/id_ed25519


echo "Stow ---------------------------------------------------------------"
rm $HOME/.bashrc
rm $HOME/.aliases
rm -rf $HOME/.config/geany/
rm -rf $HOME/.config/gtk-3.0/

cd $HOME/.dotfiles/

tools=(
"astro"
"alacritty"
"bash"
"dunst"
"geany"
"git"
"gtk-3.0"
"images"
"tinyvim"
"neofetch"
"scripts"
"suckless"
"ssh"
) for tool in ${tools[@]}
do 
	stow $tool
done

echo "Compile DWM ---------------------------------------------------------------"

tools=( "dwm" "st" "slstatus" "dmenu" "slock" "surf" )
for tool in ${tools[@]}
do 
	cd $HOME/.config/suckless/$tool
  make
  sudo make clean install
done

if [[ ! -d /$HOME/.local/share/dwm ]]; then
  mkdir /usr/share/xsessions/
fi

echo "Add lightdm -----------------------------------------------------------------"
sudo mv /usr/share/xsessions/dwm.desktop /usr/share/xsessions/dwm.desktop.bkp
sudo mv $HOME/.dotfiles/scripts/.config/scripts/config/dwm.desktop /usr/share/xsessions/dwm.desktop
sudo mv /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bkp
sudo mv $HOME/.dotfiles/scripts/.config/scripts/config/lightdm.conf /etc/lightdm/lightdm.conf
sudo mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.bkp
sudo mv $HOME/.dotfiles/scripts/.config/scripts/config/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf


echo "Add autostart -------------------------------------------------------------"
if [[ ! -d /$HOME/.local/share/dwm ]]; then
  mkdir $HOME/.local/share/dwm
fi

rm $HOME/.local/share/dwm/autostart.sh
ln -s $HOME/.config/suckless/autostart.sh $HOME/.local/share/dwm/autostart.sh

# echo "Add dwmblocks scripts -----------------------------------------------------"
# if [[ ! -d /$HOME/.local/bin ]]; then
#   mkdir $HOME/.local/bin/
# fi
#
# rm $HOME/.local/bin/sb-status2d
# rm $HOME/.local/bin/sb-ram
# rm $HOME/.local/bin/sb-volume
# rm $HOME/.local/bin/sb-battery
# rm $HOME/.local/bin/sb-internet
# rm $HOME/.local/bin/sb-datetime
#
# ln -s $HOME/dotfiles/config/suckless/dwmblocks/scripts/sb-status2d $HOME/.local/bin/sb-status2d
# ln -s $HOME/dotfiles/config/suckless/dwmblocks/scripts/sb-ram $HOME/.local/bin/sb-ram
# ln -s $HOME/dotfiles/config/suckless/dwmblocks/scripts/sb-volume $HOME/.local/bin/sb-volume
# ln -s $HOME/dotfiles/config/suckless/dwmblocks/scripts/sb-battery $HOME/.local/bin/sb-battery
# ln -s $HOME/dotfiles/config/suckless/dwmblocks/scripts/sb-internet $HOME/.local/bin/sb-internet
# ln -s $HOME/dotfiles/config/suckless/dwmblocks/scripts/sb-datetime $HOME/.local/bin/sb-datetime


