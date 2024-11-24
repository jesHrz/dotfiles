# Dotfiles

Use `stow` to manage my dotfiles. 
To install `stow` on Arch Linux

```
yay -S stow
```

To install dotfiles, use
```
stow -R <dotfiles> --dotfiles
```

## kitty

Font requirements: `Meslo Nerd Font`, which is configured in `kitty.conf` and used by oh-my-zsh powerlevel10k theme. 
To install this font on Arch Linux:

```
yay -S ttf-meslo-nerd
```

## Hyprland

Software Requirements:
- waybar
- hyprland > 0.45
- hyprpaper
- hyprlock
- hypridle
- hyprsunset
- swaync
- rofi-wayland
- networkmanager
- bluez
- fcitx5
- cliphist

Font requirements:
- otf-fira-sans
- otf-font-awesome

Theme requirements:
- bibata-cursor-theme-bin: the cursor theme
- papirus-icon-theme
- libadwaita
