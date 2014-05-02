dotvim
======

My VIM ~/.vim folder.
Comes with following modules:
* YouCompleteMe auto completion (has semantic support for C-family languages)
* alternate (allows to switch between C source/header files)
* NerdTree (file tree, hidden by default)
* syntastic (auto compile C source files and review compiler output inside vim)
* vim-easymoyion (fast jumping to specific positions inside the current viewport of a file)
* vim-nerdtree-tabs (one NerdTree instance that is persisted over all tabs)
* command-t (open any file under the current working directory in the running VIM)

#### Clone and init submodules
Use option one for git > 1.6.5:
1. Clone using the recursive option:
git clone --recursive git://github.com/foo/bar.git
2. Clone using and use submodule update --init:
git clone git://github.com/foo/bar.git
cd bar
git submodule update --init

#### Installation from source (Linux)
Get the dependencies for vim (Ubuntu):
sudo apt-get build-dep vim
Compile VIM from the Mercurial repo or github mirror using following configure command (X11 integration optional, requires alot of dependencies):
./configure --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu --with-features=huge --enable-rubyinterp --enable-perlinterp --enable-cscope --enable-gui=auto --enable-gtk2-check --with-x

Next, just symlink ~/.vimrc and ~/.vim/ to this repository!
For example:  
ln -s ~/git/dotvim/vimrc ~/.vimrc  
ln -s ~/git/dotvim/ ~/.vim  
See [Michael Smalley's tutorial](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/) for more info.

Finish by compiling YouCompleteMe autocompletion, see [here](https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64-super-quick-installation) (requires CMake):  
cd ~/.vim/bundle/YouCompleteMe
./install.sh
