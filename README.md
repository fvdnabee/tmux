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
```
ln -s ~/GIT/dotfiles/zsh/zshrc ~/.zshrc
```

Install oh-my-zsh.
Change ZSH on L21 in zshrc to point to the oh-my-zsh
installation.

Install powerlevel-9k theme and nerd-fonts. See:
* https://github.com/Powerlevel9k/powerlevel9k/wiki/Install-Instructions
* https://github.com/ryanoasis/nerd-fonts
