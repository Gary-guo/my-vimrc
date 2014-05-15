#!/bin/bash

today=`date +%Y%m%d`
CURRENT_DIR=`pwd` #获取当前路径

echo "Step1: Install git tool,libclang and update the compiler."
sudo apt-get install -y git git-core
sudo apt-get install -y build-essential cmake python-dev
sudo apt-get install -y libclang-3.5-dev

echo "Step2: backing up current vim config"
for i in $HOME/.vim $HOME/.vimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc; do [ -L $i ] && unlink $i; done

echo "Step3: setting up symlinks"
if [ -e "$CURRENT_DIR/vimrc" ]; then
    ln -sf $CURRENT_DIR/vimrc $HOME/.vimrc
fi

echo "Step4: install vundle"
if [ ! -e $HOME/.vim/bundle/vundle ]; then
    echo "Installing Vundle"
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
else
    echo "Upgrade Vundle"
    cd "$HOME/.vim/bundle/vundle" && git pull origin master
fi

echo "Step5: update/install plugins using Vundle"
system_shell=$SHELL
export SHELL="/bin/bash"
vim -u $HOME/.vimrc +PluginInstall +PluginClean +qall
export SHELL=$system_shell

echo "Step6 compile YouCompleteMe"
echo "It will take a long time, juse be patient!"
echo "If error, you need to compile it yourself"
echo "cd $HOME/.vim/bundle/YouCompleteMe/ && bash -x install.sh --clang-completer --system-libclang"
cd $CURRENT_DIR/bundle/YouCompleteMe/
bash -x install.sh --clang-completer --system-libclang

echo "Install Done!"
