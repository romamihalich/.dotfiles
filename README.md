Clone repo:
```bash
git clone --recurse-submodules git@github.com:romamihalich/.dotfiles.git
```

Install stow for managing files
```bash
sudo pacman -S stow
```

In ".dotfiles" directory:
```bash
for dir in */; do stow "${dir%/}"; done
```

Shell setup:
```bash
sudo pacman -S zsh zsh-syntax-highlighting zsh-completions zsh-history-substring-search
chsh -s /bin/zsh
```

Font:
```bash
sudo pacman -S ttf-hack-nerd
```

Awesome setup:
```bash
sudo pacman -S xorg awesome feh thunar volumeicon picom network-manager-applet conky udiskie dmenu
feh --bg-fill /path/to/wallpaper
```
