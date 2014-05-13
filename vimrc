"通用基本设置
set history=1000
set enc=utf-8 "编码encoding
set fenc=utf-8 "文件编码fencoding
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 "文件编码检测类型及支持格式fileencodings
syntax enable on "语法高亮
set showcmd "显示当前执行的命令
set showmode "显示当前vim模式
set scrolloff=3 "光标移动到buffer的顶部和底部时保持3行距离
set confirm "在处理未保存或只读文件时候,弹出确认
set clipboard+=unnamed "共享剪切板
set tabstop=4 "设置tab长度为4
set shiftwidth=4
set softtabstop=4
set expandtab "将tab键展开为空格
set mouse=a "启用鼠标
set selection=exclusive
set selectmode=mouse,key
set showmatch
set matchtime=1
set incsearch
set ignorecase
set hlsearch
set nofoldenable "禁止代码折叠
"
"自定义快捷键
let mapleader=';' "将<leader>重置为';'
map <Left> <Nop> "强迫自己使用hjkl
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
nnoremap <leader>p :bprev<CR> "自定义buffer跳转
nnoremap <leader>n :bnext<CR>
nnoremap <leader>d :bdelete<CR> "关闭当前buffer标签
"
"
"使用Vundle管理插件
"安装Vundle
"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"使用帮助
":PluginList    -list configured plugins
":PluginInstall(!)  -install (update) plugins
":PluginSearch(!) foo   -search (or refresh cache first) for foo
":PluginClean(!)    -confirm (or auto-approve) removal of unused plugins
"
"see :h vundle for more details or wiki for FAQ
"
"Vundle 配置
set nocompatible    "be iMproved, required
filetype off
"
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
"My Plugins
"
Plugin 'Valloric/YouCompleteMe' "自动补全
" YouCompleteMe 配置{
" 必要条件: $sudo apt-get install build-essential cmake python-dev
" $sudo apt-get install libclang-3.4-dev 
" 安装YouCompleteMe,进入源码目录执行./install.sh --clang-completer --system-libclang
" 需要配置适合自己的.ycm_extra_conf.py文件
let g:ycm_extra_conf_globlist=['~/.vim/bundle/YouCompleteMe/cpp/ycm/*','!~/*']
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py' "设置全局配置模板
"符号触发器
let g:ycm_semantic_triggers={
    \   'c' : ['->', '.'],
    \   'objc' : ['->', '.'],
    \   'ocaml' : ['.', '#'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'perl' : ['->'],
    \   'php' : ['->', '::'],
    \   'cs,java,javascript,d,vim,python,per16,scala,vb,elixir,go' : ['.'],
    \   'ruby' : ['.', '::'],
    \   'lua' : ['.', ':'],
    \   'erlang' : [':'],
    \}
let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments = 1 "在注释输入中也能补全
let g:ycm_complete_in_strings = 1 "在字符串输入中也能补全 
let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全
"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义及声明处
"}
"
Plugin 'scrooloose/syntastic' "语法检查
"syntastic 配置{
let g:syntastic_ignore_files=[".*\.py$"] "禁止对Python语法检测
"}
"Plugin 'davidhalter/jedi' "python补全,语法检测
"
"Plugin 'SirVer/ultisnips' "代码片段不全
"
Plugin 'bling/vim-airline'
"airline 配置{ 
"注意需要安装powerline-fonts,并设置终端字体为powerline-fonts中的字体
"powerline-fonts 安装
"git clone https://github.com/Lokaltog/powerline-fonts ~/.fonts/
"执行下面命令fc-cache -vf ~/.fonts
"将终端设置为powerline字体,我设置的为droid sans mono for powerline字体
set laststatus=2 "设置状态行高度
set t_Co=256
let g:airline#extensions#tabline#enabled=1 "此处默认开启tab栏,需要用户自定义buffer跳转操作快捷键
let g:airline_theme='murmur' "主题,可以根据喜好切换
let g:airline_powerline_fonts=1
let g:airline_section_b='%{strftime("%d/%m/%y-%H:%M")}' "显示时间
let g:airline_section_x='ASCII=%0.3b|HEX=0x%02.2B' "显示光标所在字符的ASCII码和16进制
let g:airline_section_y='BN:%{bufnr("%")}' "表示正在编辑的是第几个文件
"}
"
Plugin 'scrooloose/nerdtree' "浏览文件目录结构
"nerdtree 配置{
let NERDChrismasTree=0
let NERDTreeWinSize=20
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.swp$']
let NERDTreeShowBookmarks=1
"let NERDTreeWinPos="right"
nnoremap <silent> <F3> :NERDTreeToggle<CR>
"}
"
Plugin 'majutsushi/tagbar' "浏览源代码标签文件,必须先安装exuberant-ctags
"tagbar 配置{
let g:tagbar_right=1
let g:tagbar_width=20
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_autofocus=1 "当打开tagbar时将光标移动到tagbar窗口
let g:tagbar_compact=1 "隐藏帮助框
let g:tagbar_show_visibility=0
let g:tagbar_singleclick=1 "单击跳转(Enter键)
let g:tagbar_autoclose=1 "当跳转后关闭tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>
"}
"
Plugin 'elzr/vim-json' "json 语法高亮
"
Plugin 'kien/ctrlp.vim' "快速寻找文件
"
Plugin 'plasticboy/vim-markdown' "markdown 语法高亮
"
Plugin 'scrooloose/nerdcommenter' "快速注释
"
Plugin 'sjl/gundo.vim' "显示vim撤销树
"
"Plugin 'tpope/vim-sleuth' "自动根据文件类型设置shiftwidth和expandtab
"
Plugin 'tpope/vim-surround' "标签自动配对，例如xml标签
"
"Color schemes
"Plugin 'tomasr/molokai'
"Plugin 'flazz/vim-colorschemes'
"
"All of your Plugins must be added before the following line
call vundle#end() "required
filetype plugin indent on "required
