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
- ttf-lxgw-wenkai-screen
- adobe-source-code-pro

## Themes

Theme requirements:
- bibata-cursor-theme-bin: the cursor theme
- papirus-icon-theme: the icon theme
- arc-gtk-theme: the gtk interface theme

Note that, to apply the gtk theme (including the icon theme), modify the gtk configuration file (.gtk-2.0, gtk-3.0/settings.ini, and gtk-4.0/settings.ini)
If it does not work, try `gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"` and `gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"`

## Fcitx5

Use `fcitx5-rime` as chinese addon and `rime-frost` as dictionary.

Fcitx5 theme
- fcitx5-material-color: the fcitx5 theme
