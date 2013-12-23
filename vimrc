""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件: vim 配置
" 
" 描述: 清晰,全面,简单,易用的vim配置
"
" 版本: 1.0
"
" 作者: gary-guo
"
" E-mail: gcgily@126.com
"
" 简单的入门教程: shell下输入命令vimtutor
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set history=1000 "历史记录数
set enc=utf-8 "设置编码encoding
set fenc=utf-8 "设置文件编码fencoding
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 "设置文件编码检测类型及支持格式fileencodings
set langmenu=zh_CN.utf-8 "语言设置
"
"
syntax enable on "设置语法高亮
set showcmd "显示当前执行的命令
set showmode "显示vim当前模式
set scrolloff=3 "光标移动到buffer的顶部和底部时保持3行距离
set title "在标签栏显示当前文件名
"
"
set confirm "在处理未保存或只读文件时候,弹出确认
set clipboard+=unnamed "共享剪切板
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"
"
"为特定格式文件指定缩进格式
" tabstop=X 编辑时一个TAB字符占多少个空格的位置 " shiftwidth=X 使用每层缩进的空格数
" softtabstop=X 方便在开启expandtab后使用退格(backspace)键,每次退格将删除X个空格
" expandtab 是否将输入的TAB自动展开成空格,开启后要输入TAB,需要Ctrl-V<TAB>
" smarttab 开启时,在行首按TAB将加入shiftwidth个空格,否则加入tabstop个空格
set autoindent "开启自动缩进
autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab
"
"
set mouse=a "启用鼠标
set selection=exclusive
set selectmode=mouse,key
set showmatch "高亮显示匹配的括号
set matchtime=1 "匹配括号高亮的时间(单位是十分之一秒)
set incsearch "随着键入即时搜索
set ignorecase "搜索忽略大小写
set hlsearch "搜索逐字符高亮
set nofoldenable "禁止代码折叠
"
"
" 自定义快捷键
let mapleader = "," "将<leader>重置为','
map <Left> <Nop>  "强迫自己使用hjkl
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
nnoremap <C-j> <C-W>j "自定义多窗口跳转
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <leader>p :bprev<CR> "自定义tab跳转
nnoremap <leader>n :bnext<CR>
nnoremap <leader>d :bdelete<CR> "关闭当前buffer标签
"
" 使用Vundle插件管理
" 下载安装:
"   $git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" 使用帮助
"   :BundleList -list configured bundles
"   :BundleInstall(!) -install(update) bundles
"   :BundleSearch(!) foo -search(or refresh cache first) for foo
"   :BundleClean(!) -confirm(or auto-approve) removal of unused bundles
"
" Vundle配置:
set nocompatible "去掉VIM兼容
filetype off "关闭自动检测文件类型 required!
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
"
" 我的插件列表及配置
"
" 状态栏显示插件
Bundle 'bling/vim-airline'
"airline 配置{ 
"注意需要安装powerline-fonts,并设置终端字体为powerline-fonts中的字体
set laststatus=2 "设置状态行高度
set t_Co=256 "设置可识别颜色
let g:airline#extensions#tabline#enabled = 1 "此处也默认开启栏tab栏,需要用户自定义buffer跳转操作快捷键
let g:airline_theme = 'murmur' "主题,可根据喜好切换
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{strftime("%d/%m/%y-%H:%M")}' "时间显示
let g:airline_section_x = 'ASCII=%03.3b|HEX=0x%02.2B' "显示光标所在字符的ascii码和16进制
let g:airline_section_y = 'BN:%{bufnr("%")}' "表示正在编辑的是第几个文件
"}
"
"浏览文件目录结构
Bundle 'scrooloose/nerdtree'
"nerdtree 配置{
let NERDChrismasTree = 0
let NERDTreeWinSize = 20
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\~$', '\.swp$']
let NERDTreeShowBookmarks = 1
"let NERDTreeWinPos = "right"
"}
"
"浏览源代码标签文件,必须先安装exuberant-ctags
Bundle 'majutsushi/tagbar'
"tagbar 配置{
let g:tagbar_right = 1
let g:tagbar_width = 20
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_autofocus = 1 "当打开tagbar时将光标移动到tagbar窗口
let g:tagbar_compact = 1 "隐藏帮助框
let g:tagbar_show_visibility = 0
let g:tagbar_show_linenumbers = 1 "显示tag所在行号
let g:tagbar_singleclick = 1 "单击跳转(Enter键)
"let g:tagbar_autoclose = 1 "当跳转后关闭tagbar
"}
"
"缩进对齐显示
Bundle 'Yggdroot/indentLine'
"indentLine 配置{
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239
let g:indentLine_enabled = 0
"}
"
filetype plugin indent on " required!
"
"
nnoremap <F2> :set number!<CR>:set foldcolumn=0<CR> "快捷键映射F2开启/关闭显示行号,并将折叠的行展开
nnoremap <F3> : silent! NERDTreeToggle<CR> "快捷键映射F3开启/关闭NERDTree
nnoremap <F4> : silent! TagbarToggle<CR> "快捷键映射F4开启/关闭tagbar
nnoremap <F5> : silent! IndentLinesToggle<CR> "快捷键映射F5开启/关闭indentLine
