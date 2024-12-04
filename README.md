# My dotfiles for tmux, bash and zsh
Note zsh is using oh-my-zsh

# Installation
## vim
```
ln -s ~/GIT/dotfiles/vim/vimrc ~/.vimrc
```

Install vim.plugged:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim
:PlugInstall
```

coc.nvim on arch requires nodejs. coc extensions require npm.
```
pacman -S nodejs npm
```

### Install coc language extensions:
When not using `let g:coc_global_extensions`, you can install the extensions
manually:
### python
```
:CocInstall coc-pyright
```

### File formats
```
:CocInstall coc-json coc-yaml
```

### javascript & typescript
```
:CocInstall coc-tsserver
```

## tmux
```
ln -s ~/GIT/dotfiles/tmux/tmux.conf ~/.tmux.conf
```
### tmuxinator
```
yay -S tmuxinator ruby-erb
sudo wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/share/zsh/site-functions/_tmuxinator
```

## zsh
Symlink zshrc:
```
ln -s ~/GIT/dotfiles/zsh/zshrc ~/.zshrc
```

### oh-my-zsh
Install oh-my-zsh from aur:
```
yay -S oh-my-zsh-git
```
Change ZSH on L40 in zshrc to point to the oh-my-zsh installation.

### powerlevel-10k theme
Install powerlevel-10k theme. See:
* https://github.com/romkatv/powerlevel10k#arch-linux
```
yay -S --noconfirm zsh-theme-powerlevel10k-git
```

Configure powerlevel10k:
```
ln -s ~/GIT/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
```
#### Optionally install a font
E.g.
* https://github.com/Powerlevel9k/powerlevel9k/wiki/Install-Instructions
* https://github.com/ryanoasis/nerd-fonts
* https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k

The Meslo Nerd font can be installed from the aur:
```
yay -S ttf-meslo-nerd-font-powerlevel10k
```

Don't forget to set the new font in the settings of your terminal emulator.

### direnv
Install [direnv](https://direnv.net/docs/installation.html) for your distro

```
pacman -S direnv
```

## git: user gitignore and gitconfig
```
ln -s ~/GIT/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/GIT/dotfiles/git/gitignore ~/.gitignore
```

Don't forget to set the correct user email and PGP signing key for the new
machine in `~/.gitconfig`.

## alacritty
```
ln -s ~/GIT/dotfiles/alacritty.toml ~/.alacritty.toml
```
