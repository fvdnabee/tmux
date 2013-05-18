dotvim
======

My VIM ~/.vim folder.

Compile VIM from their Mercurial repo using following configure command (X11 integration optional, requires alot of dependencies):  
./configure --with-features=huge --with-x  --enable-gui=auto --enable-pythoninterp --enable-rubyinterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/

#### Clone and init submodules
Use option one for git > 1.6.5:  
1. Clone using the recursive option:  
git clone --recursive git://github.com/foo/bar.git  
2. Clone using and use submodule update --init:  
git clone git://github.com/foo/bar.git  
cd bar  
git submodule update --init

#### Installation (Linux)
Just symlink ~/.vimrc and ~/.vim/ to this repository!  
For example:  
ln -s ~/git/dotvim/vimrc ~/.vimrc  
ln -s ~/git/dotvim/ ~/.vim

See [Michael Smalley's tutorial](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/) for more info.
