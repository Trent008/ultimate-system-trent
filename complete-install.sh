pacstrap /mnt base base-devel linux linux-firmware nano adapta-gtk-theme blueberry brightnessctl code dunst feh firefox grub gst-plugin-pipewire intel-ucode libxft libxinerama networkmanager papirus-icon-theme picom pipewire pipewire-alsa pipewire-jack pipewire-pulse playerctl shotgun spotify-launcher terminator thunar ttf-nerd-fonts-symbols-mono xorg-server xorg-xinit xorg-xrandr xorg-xsetroot
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/US/Central /etc/localtime
hwclock --systohc
nano /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
export LANG=en_US.UTF-8
echo archlinux > /etc/hostname
touch /etc/hosts
cp ultimate-system/hosts > /etc/hosts
passwd
pacman -S grub efibootmgr
mkdir /boot/efi
mount /dev/nvme0n1p1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
useradd -m trent
passwd trent
usermod -aG wheel,audio,video,storage trent
EDITOR=nano visudo
systemctl enable bluetooth.service
systemctl enable NetworkManager.service
exit
umount /mnt