#!/bin/bash
echo "Tailscale Install for Arch"
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

echo
echo "Installing Tailscale"
echo

echo "Install"
sudo pacman -S --needed tailscale --noconfirm
yay -S --needed ktailctl --noconfirm

echo "Enabling Service"
sudo systemctl enable --now tailscaled

echo "Initial Config"
sudo tailscale up

echo
cat << "EOF" 
   ___       _      ______                 _ 
  |_  |     | |     |  _  \               | |
    | | ___ | |__   | | | |___  _ __   ___| |
    | |/ _ \| '_ \  | | | / _ \| '_ \ / _ \ |
/\__/ / (_) | |_) | | |/ / (_) | | | |  __/_|
\____/ \___/|_.__/  |___/ \___/|_| |_|\___(_)
                                             
                                             

EOF
