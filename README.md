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
- hyprland
- hyprpaper
- hyprlock
- hypridle
- hyprshade
- wlogout
- pywal: apply `wal -ei <your wallpaper>` first after you change the wallpaper
- rofi-wayland
- networkmanager
- bluez
- fcitx5

Font requirements:
- otf-fira-sans
- otf-font-awesome