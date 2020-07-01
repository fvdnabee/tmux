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

Compile YCM (without C semantic support):
```
cd ~/.vim/plugged/YouCompleteMe/
python3 install.py
```

## tmux
```
ln -s ~/GIT/dotfiles/tmux/tmux.conf ~/.tmux.conf
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
Change ZSH on L21 in zshrc to point to the oh-my-zsh installation.

### powerlevel-10k theme
Install powerlevel-10k theme. See:
* https://github.com/romkatv/powerlevel10k#arch-linux
```
yay -Sy --noconfirm zsh-theme-powerlevel10k-git
```
#### Optionally install a font
E.g.
* https://github.com/Powerlevel9k/powerlevel9k/wiki/Install-Instructions
* https://github.com/ryanoasis/nerd-fonts
* https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
