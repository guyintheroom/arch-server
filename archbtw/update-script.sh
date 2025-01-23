#!/bin/bash
# Master Script for Updating Arch Linux
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
while true; do
    echo
    echo "Arch Update Script"
    echo
    echo "What do you want to do?"
    echo
    echo "1. Update Arch w/ Snapshot"
    echo "2. Update Arch"
    echo "3. Read Latest Pacman News"
    echo "4. Pacman/Yay Cleanup"
    echo "5. Nuke Trash List"
    echo "6. Update Mirrors"
    echo "7. Run Fastfetch"
    echo
    echo "x. Exit Installer"
    echo

    read choice

    case $choice in
        1)
            echo
            echo "Update Arch w/ Snapshot"
            echo
            
            echo
            echo "Creating Snapshot"
            sudo timeshift --create --comments Normal-Update
            
            echo
            echo "Running Yay"
            yay

            echo
            echo "Updating Flatpak"
            flatpak update
            
            echo
            echo "Package Summary"
            yay -Ps
            
    	    echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        2)
            echo
            echo "Update Arch"
            echo
            
            echo
            echo "Running Yay"
            yay
            
            echo
            echo "Updating Flatpak"
            flatpak update
            
            echo
            echo "Summary"
            yay -Ps
            
    	    echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        3)
            echo
            echo "Fetching and Showing Latest News"
            echo
            echo "Updating Feed"
            yay -S --needed pacnews --noconfirm

            echo
            echo "Showing News"
            echo
            pacnews

            echo
            echo "End of News - Press any key to continue!"
            read
            ;;
        4)
            echo
            echo "Pacman/Yay Cleanup"
            echo
            echo "Pre-Summary"
            yay -Ps
            echo "Press any key to continue!"
            read
            
            echo "Cleaning Pacman Cache (Keeping 1 Previous Version)"
            sudo paccache -rk1
	    
            echo "Cleaning Yay Cache"
            yay -Sca

            echo "Removing Orphaned Packages"
            yay -Rns $(yay -Qtdq)

            echo "Post-Summary"
            yay -Ps

            echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        5)
            echo
            echo "Nuking Trash List"
            echo
            sudo rm -rf ~/.local/share/Trash/*

            echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        6)
            echo
            echo "Updating Mirrors"
            echo "Choosing the fastest mirrors based on location"
            echo

            rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist
            echo
            echo "Mirrors Have Been Rated and Updated!"
            echo
            echo "Job Done!  ZSH must be reloaded for the changes to apply."
            echo "Press any key to continue!"
            read
            clear && zsh
            ;;
        7)
            echo
            echo "Running Fastfetch"
            echo
            
            fastfetch
            
            echo
            echo "Job Done!  Press any key to continue!"
            read
            ;;
        x)
            echo
            echo "Job Done!  Exiting..."
            echo
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
