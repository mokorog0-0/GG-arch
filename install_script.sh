#!/bin/bash

echo "select version GG-arch"
echo "welcome to the installer of my arch linute assembly (gg-arch) at this stage you need to choose which config you want. 
here you will find what they look like : https://github.com/mokorog0-0/GG-arch/blob/main/README.md"

echo " [1] clods configuration "
echo " [2] kitten configuration"
echo " [3] cancel installation "

read -p "select: " choice 

case $choice in
    1)
        sudo pacman -S hyprland kitty pavucontrol swww waybar rofi sddm --needed firefox base-devel git xdg-desktop-portal-hyprland dolphin telegram-desktop steam nerd-fonts btop ranger
        git clone https://aur.archlinux.org/yay.git 
        cd yay && makepkg -si
        cd
        yay -S tty-clock

        cd ~/.config
        sudo rm -rf kitty hypr waybar rofi neofetch
        cd

        git clone --depth 1 --sparse https://github.com/mokorog0-0/GG-arch.git temp-repo
        cd temp-repo
        git sparse-checkout init --cone
        git sparse-checkout set config_cloud
        cp -r config_cloud/* ~/.config/
        cd ..
        rm -rf temp-repo

        chmod +x ~/.config/scripts/bay_night.sh
        sudo systemctl enable sddm

        mkdir -p ~/my_network_tools
        cd ~/my_network_tools
        git clone https://github.com/zbaylin/rofi-wifi-menu.git
        cd

        sudo systemctl start sddm

        read -p "Want to start Hyprland? [yes/no]: " start_choice
        if [[ "$start_choice" == "yes" ]]; then
            hyprland
        fi
        ;;

2)
        sudo pacman -S hyprland kitty swww pavucontrol waybar rofi sddm --needed firefox base-devel git xdg-desktop-portal-hyprland dolphin telegram-desktop steam nerd-fonts btop
        git clone https://aur.archlinux.org/yay.git 
        cd yay && makepkg -si
        cd

        cd ~/.config
        sudo rm -rf kitty hypr waybar rofi neofetch
        cd

        git clone --depth 1 --sparse https://github.com/mokorog0-0/GG-arch.git temp-repo
        cd temp-repo
        git sparse-checkout init --cone
        git sparse-checkout set config
        cp -r config/* ~/.config/
        cd ..
        rm -rf temp-repo

        mkdir -p ~/my_network_tools
        cd ~/my_network_tools
        git clone https://github.com/zbaylin/rofi-wifi-menu.git
        cd

        sudo systemctl enable sddm
        sudo systemctl start sddm

        read -p "Which waybar do you want to choose? [V0.5/V1]: " bar_choice

        if [[ "$bar_choice" == "1" ]]; then
            shopt -s dotglob nullglob
            cp -r ~/.config/waybar/config1/* ~/.config/waybar/
            shopt -u dotglob nullglob
            rm -rf ~/.config/waybar/config1 ~/.config/waybar/config2
        elif [[ "$bar_choice" == "0.5" ]]; then
            shopt -s dotglob nullglob
            cp -r ~/.config/waybar/config2/* ~/.config/waybar/
            shopt -u dotglob nullglob
            rm -rf ~/.config/waybar/config1 ~/.config/waybar/config2
        else
            echo "Invalid choice for waybar version"
        fi

        read -p "Want to start Hyprland? [yes/no]: " start_choice
        if [[ "$start_choice" == "yes" ]]; then
            hyprland
        fi
        ;;
esac
