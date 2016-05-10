#!/bin/bash
#OS:  Ubuntu16.04
#vim version: 7.4

CURRENT_DIR=`pwd`

echo "Step1: 安装系统依赖"
sudo apt-get install -y git git-core
sudo apt-get install -y build-essential cmake
sudo apt-get install -y python-dev python3-dev
sudo apt-get install -y libclang-3.8-dev
sudo apt-get install -y ctags
sudo apt-get install -y silversearcher-ag

echo "Step2: 备份当前配置"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc; do [ -L $i ] && unlink $i; done

echo "Step3: 创建新的软链接"
if [ -e "$CURRENT_DIR/vimrc" ]; then
    ln -sf $CURRENT_DIR/vimrc $HOME/.vimrc
fi

echo "Step4: 安装插件管理工具vim-plug"
if [ ! -f $HOME/.vim/autoload/plug.vim ]; then
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Step5: 安装/更新 插件"
system_shell=$SHELL
export SHELL="/bin/sh"
vim -u $HOME/.vimrc +PlugInstall! +PlugClean! +qall
export SHELL=$system_shell

echo "Step6 编译 YouCompleteMe"
echo "cd $HOME/.vim/bundle/YouCompleteMe/ && python install.py --clang-completer"
cd $HOME/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
if [`which clang`]  # check system clang
then
    python install.py --clang-completer  --system-libclang # use system clang
else
    python install.py --clang-completer
fi

cd $CURRENT_DIR

echo "安装完成!"
