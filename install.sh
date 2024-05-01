# install all my packages
sudo pacman -Syu
sudo pacman -S libxinerama libx11 libxft xorg-server xorg-xinit xorg-xsetroot xorg-xrandr rofi
sudo pacman -S code terminator thunar feh spotify-launcher playerctl firefox dunst blueberry xarchiver unzip
sudo pacman -S adapta-gtk-theme papirus-icon-theme ttf-nerd-fonts-symbols-mono shotgun brightnessctl picom
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S xcursor-breeze
# start bluetooth and wifi
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now NetworkManager.service
cd ~
# clone and install dwm
git clone https://github.com/Trent008/dwm
# compiles dwm and dmenu, creates .xinitrc, and applies themes
./ultimate-system/update.sh
# setup with my git username and email
git config --global user.email "trenthekman68@gmail.com"
git config --global user.name "Trent008"