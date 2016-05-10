" ==========================================
" 基本配置
" ==========================================
"开启语法高亮
syntax enable on
"智能缩进
set tabstop=4
set shiftwidth=4
set softtabstop=4
"将tab展开为空格
set expandtab
"中文乱码
set fileencodings=utf-8,chinese
"显示行号
set number
"启用鼠标 
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"显示高亮搜索
set hlsearch
"开启状态栏
set ruler
"设置状态行高
set laststatus=2
"显示当前执行的命令
set showcmd
"显示当前VIM模式
set showmode
"光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
"在处理未保存或只读文件时,弹出确认
set confirm
"共享剪切板
set clipboard+=unnamed
"禁止代码折叠
set nofoldenable
"
" ==========================================
" bundle 插件管理和配置项
" PlugInstall   install plugins
" PlugUpdate    install or update plugins
" PlugClean[!]  remove unused directories(bang version will clean without
" prompt)
" PlugUpgrade   upgrade vim-plug itself
" PlugSTatus    check the status of plugins
" PlugDiff      Examine changes from the provious update and the pending
" changes
"==========================================
set nocompatible
filetype off

call plug#begin('~/.vim/bundle')
"主题及美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"自动补全
"Plug 'Valloric/YouCompleteMe'
"语法检查
Plug 'scrooloose/syntastic'
"浏览文件目录结构
Plug 'scrooloose/nerdtree'
"源代码标签文件
Plug 'majutsushi/tagbar'
"显示vim撤销树
Plug 'sjl/gundo.vim'

call plug#end()
