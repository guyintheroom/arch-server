#!/bin/bash
echo "Minimal Server Base for Arch Machines"
echo
echo "Setting Root Directory for Script"
cd ..
RDIR="$(pwd)"
echo $RDIR
echo
cat << "EOF" 
                   -`
                  .o+`
                 `ooo/
                `+oooo:
               `+oooooo:
               -+oooooo+:
             `/:-:++oooo+:
            `/++++/+++++++:
           `/++++++++++++++:
          `/+++ooooooooooooo/`
         ./ooosssso++osssssso+`
        .oossssso-````/ossssss+`
       -osssssso.      :ssssssso.
      :osssssss/        osssso+++.
     /ossssssss/        +ssssooo/-
   `/ossssso+/:-        -:/+osssso+-
  `+sso+:-`                 `.-/+oso:
 `++:.                           `-/+/
 .`                                 ` 


EOF
# Initial Things
cd
mkdir ~/.builds
mkdir ~/.repo-resources
sudo cp -rT $RDIR/config-files/dot-files/pacman.conf /etc/pacman.conf
sudo cp -rT $RDIR/config-files/dot-files/makepkg.conf /etc/makepkg.conf
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel git pacman-contrib nano cifs-utils --noconfirm
git config --global core.editor nano
cp -rT $RDIR/arch-btw/update-script.sh ~/.repo-resources/update-script.sh

echo "Installing Yay!"
git clone https://aur.archlinux.org/yay.git ~/.builds/yay
cd ~/.builds/yay
makepkg -si --noconfirm
cd

echo
echo "Installing Standard Apps"
echo
sudo pacman -S --needed fastfetch arch-audit --noconfirm
yay -S --needed timeshift mkinitcpio-firmware downgrade rate-mirrors-bin --noconfirm

echo
echo "Terminal Things"
echo
sudo pacman -S --needed tldr speedtest-cli thefuck bat glances nethogs dust --noconfirm

echo
echo "Importing Terminal Dot-Files"
echo
cp -rT $RDIR/config-files/dot-files/.bashrc ~/.bashrc
cp -rT $RDIR/config-files/dot-files/.aliases ~/.aliases

# Complete!
echo
cat << "EOF" 
   ___       _      ______                 _ 
  |_  |     | |     |  _  \               | |
    | | ___ | |__   | | | |___  _ __   ___| |
    | |/ _ \| '_ \  | | | / _ \| '_ \ / _ \ |
/\__/ / (_) | |_) | | |/ / (_) | | | |  __/_|
\____/ \___/|_.__/  |___/ \___/|_| |_|\___(_)
                                             
                                             
______     _                 _   _           
| ___ \   | |               | | | |          
| |_/ /___| |__   ___   ___ | |_| |          
|    // _ \ '_ \ / _ \ / _ \| __| |          
| |\ \  __/ |_) | (_) | (_) | |_|_|          
\_| \_\___|_.__/ \___/ \___/ \__(_) 
EOF
