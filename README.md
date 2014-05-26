my-vimrc
========

##更改日记(2014-05-26)

####基本设置
+ 编码设置为UTF-8
+ 允许使用鼠标
+ 开启语法高亮
+ tab键用空格代替
+ 即时搜索显示
+ 自定义多buffer跳转快捷键
+ 强迫自己使用hjkl 

####添加插件
+ [vundle](https://github.com/gmarik/vundle)用来管理插件
+ [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)C/C++自动补全
+ [syntastic](https://github.com/scrooloose/syntastic)语法检查
+ [vim-airline](https://github.com/bling/vim-airline)状态行插件
+ [nerdtree](https://github.com/scrooloose/nerdtree)目录树显示
+ [tagbar](https://github.com/majutsushi/tagbar)显示函数及对象列表(代码标签)
+ [vim-json](https://github.com/elzr/vim-json)json语法高亮
+ [ctrlp.vim](https://github.com/kien/ctrlp.vim)快速寻找文件
+ [vim-markdown](https://github.com/plasticboy/vim-markdown)markdown语法高亮
+ [nerdcommenter](https://github.com/scrooloose/nerdcommenter)快速注释
+ [gundo.vim](https://github.com/sjl/gundo.vim)显示vim撤销树
+ [vim-surround](https://github.com/tpope/vim-surround)标签自动配对,例如XML标签

####增加自动安装脚本
```sh
$git clone https://github.com/Gary-guo/my-vimrc.git
$cd my-vimrc
$bash install.sh #or bash -x install.sh
```
