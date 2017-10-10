set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = "\<Space>"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""" general setting """""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置自动读取
set autoread
" 设置显示命令
set showcmd
" 不兼容vi
set nocompatible
" 显示行号
set number
"检测文件的类型
filetype on
"记录历史的行数
set history=1000
"vim使用自动对起，也就是把当前行的对起格式应用到下一行；
" set autoindent
"依据上面的对起格式，智能的选择对起方式，对于类似C语言编写上很有用
set smartindent
"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
set tabstop=4
set shiftwidth=4
"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch
"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
set vb t_vb=
"在编辑过程中，在右下角显示光标位置的状态行
set ruler
"默认情况下，寻找匹配是高亮度显示的，该设置关闭高亮显示
"set nohls
"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回
set incsearch
" 查找忽略大小
set ignorecase

set backspace=indent,eol,start
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 基于缩进或语法进行代码折叠"
"set foldmethod=indent
"set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
set encoding=utf-8
" 使用鼠标
set mouse=a
set scrolloff=5
" autosave
let autosave=2
" 换行
set wrap
syntax enable
colorscheme monokai

" 自动回到上次的位置
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" autoload _vimrc
autocmd! bufwritepost $HOME/.vimrc source %

" 设置<F5>运行文件
function! Run()
	if &filetype == 'python'
		exec ":call RunPy()"
	endif
	if &filetype == 'cpp'
		exec ":call RunC()"
	endif
endfunc

function! RunPy()
	exec "w"
	exec "!python3 %"
endfunc

function! RunC()
	exec "w"
	exec "!gcc -o a.out main.cpp -lstdc++ && ./a.out"
	return
	let compilecmd="!gcc "
	let compileflag="-o %< -lstdc++"
	" if search("mpi\.h") != 0
	"     let compilecmd = "!mpicc "
	" endif
	" if search("glut\.h") != 0
	"     let compileflag .= " -lglut -lGLU -lGL "
	" endif
	" if search("cv\.h") != 0
	"     let compileflag .= " -lcv -lhighgui -lcvaux "
	" endif
	" if search("omp\.h") != 0
	"     let compileflag .= " -fopenmp "
	" endif
	" if search("math\.h") != 0
	"     let compileflag .= " -lm "
	" endif
	" if search("iostream") != 0
	"     let compileflag .= " -lstdc++ "
	" endif
	" echo compileflag
	exec compilecmd." % ".compileflag
	exec "!\.\/%<"
endfunc

function! Debug()
	if &filetype == 'cpp'
		exec ":call DebugCpp()"
	endif
endfunc

function! DebugCpp()
	exec "w"
	exec "!g++ -std=c++11 -g main.cpp -o /tmp/a.out && gdb /tmp/a.out"
endfunc

map <F6> :call Debug()<CR>
map <F5> :call Run()<CR>
" 设置sh的文件头
function!  SetTitleForSh()
	if &filetype == 'sh'
		call setline(1, "\############################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Program: ")
		call append(line(".")+2, "\# Usage :")
		call append(line(".")+3, "\# Author :".$author_name)
		call append(line(".")+4, "\# email :".$author_email)
		call append(line(".")+5, "\# create time :".strftime("%c"))
		call append(line(".")+6, "\#======================================")
		call append(line(".")+7, "\#!/bin/bash")
		call append(line(".")+8, "")
	endif

endfunc
autocmd BufNewFile *.sh, exec ":call SetTitleForSh()"
let $author_name = "Jefung"
let $author_email = "865424525jefung@gmail.com"

" 设置java的文件头
function! PreBuildInJava()
	call setline(1,"public class ".expand("%:r")."{")
	call setline(line(".")+1,"")
	call setline(line(".")+2,"	public static void main(String args[]){")
	call setline(line(".")+3,"")
	call setline(line(".")+4,"	}")
	call setline(line(".")+5,"")
	call setline(line(".")+6,"}")
endfunc
autocmd BufNewFile *.java exec ":call PreBuildInJava()"

" 设置python的文件头
function! SetTitleForPy()
	call setline(1,"#!/usr/bin/env python3")
	call setline(line(".")+1,"# -*- coding: utf-8 -*- ")
	call setline(line(".")+2,"")
endfunc
autocmd BufNewFile *.py exec ":call SetTitleForPy()"
"-----------------------------------------------------------------------------------------------------
"-----------------------------------------------------------------------------------------------------
"-----------------------------------------------------------------------------------------------------




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""   Shortcut  """""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "m"
nmap <C-tab> :w<CR>
map <F9> :NERDTreeToggle<CR>
map <F10> :TlistToggle <CR>
nmap <Tab> :bnext<CR>
nmap <Leader><Tab> :bp<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q : w! <BAR>  bp <BAR> bd #<CR>
nmap <Leader>w :w<CR>

" ctrlp
"find file
nnoremap <Leader>ff :CtrlP
nnoremap <Leader>fb :CtrlPBuffer<CR>
"find buffer
"   Show all open buffers and their status
"	nmap <leader>bl :ls<CR>

" quickly comment
nmap <leader>/ <leader>c<Space>

" phpdoc
inoremap <C-\> <ESC>:call PhpDocSingle()<CR>
nnoremap <C-\> :call PhpDocSingle()<CR>
vnoremap <C-\> :call PhpDocRange()<CR>

" 回车增加空行
nmap  <silent> <C-m> :call append('.','') <CR>

" 取消方向键的移动
" abandon move key
map <Left>	<Nop>
map <Right>	<Nop>
map <Up>	<Nop>
map <Down>	<Nop>

" 全局复制
" global yank and paste
vnoremap <Leader>y  "+y
nnoremap <Leader>p  "+p

" 窗口移动
" move window
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-k> <C-W>k
map <C-l> <C-W>l

" markdown-preview.vim 快捷
" nmap <Plug>mdp <Plug>MarkdownPreview<CR>
" nmap <Plug>mdps <Plug>MarkdownPreviewStop<CR>

" easymotion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
" 重新加载vimrc
nmap <Leader>r :source $MYVIMRC<CR>
autocmd! bufwritepost vimrc source $MYVIMRC
"-----------------------------------------------------------------------------------------------------
"-----------------------------------------------------------------------------------------------------
"-----------------------------------------------------------------------------------------------------



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""    Plugin    """"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"########################
"      <多光标操作>     #
"########################
Plugin 'terryma/vim-multiple-cursors'
" cancle the default keymap
"let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"########################
"     <\多光标操作>     #
"########################
"########################
"      <自动补全>       #
"########################
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf ='/home/jefung/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"nnoremap <leader>y: let g:ycm_auto_trigger=0<CR>
let g:ycm_confirm_extra_conf=0  " 打开vim时不再询问是否加载ycm_extra_conf.py配置
"set completeopt=longest,menu
""让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_cache_omnifunc=0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_tag_files = 1
" 移除ycm对c家族的代码检测，采用syntastic
let g:ycm_show_diagnostics_ui = 0
"########################
"     <\自动补全>       #
"########################

"########################
"      <语法检测>       #
"########################
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"修改Locaton List窗口高度
let g:syntastic_loc_list_height = 5
"打开文件时自动进行检查
let g:syntastic_check_on_open = 1
"自动跳转到发现的第一个错误或警告处
let g:syntastic_auto_jump = 1

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='►'
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"########################
"      <\语法检测>      #
"########################

"########################
"    <自动切换输入法>   #
"########################
" Plugin 'humiaozuzu/fcitx-status'
"########################
"    <\自动切换输入法>  #
"########################


"########################
"       <文件操作>      #
"########################
Plugin 'scrooloose/nerdtree'
let NERDTreeShowHidden=0
let NERDTreeWinSize=20
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endi
" vim不指定具体文件打开是，自动使用nerdtree
" autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 当vim中没有其他文件，值剩下nerdtree的时候，自动关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"########################
"     <\文件操作>       #
"########################


"########################
"     <函数操作>       #
"########################
Plugin 'vim-scripts/taglist.vim'
let Tlist_Show_Menu = 1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window=1

"########################
"     <\函数操作>       #
"########################



"########################
"        <md>           #
"########################
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter=1
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
let g:mkdp_path_to_chrome = "google-chrome"
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）

let g:mkdp_auto_start = 0
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" markdown 文件的时候打开一次

let g:mkdp_auto_open = 0
" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
" 览窗口

let g:mkdp_auto_close = 1
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
" 自动关闭预览窗口

let g:mkdp_refresh_slow = 0
" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
" 更新预览

let g:mkdp_command_for_global = 0
" 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
" 文件可以使用改命令
"########################
"        <\md>          #
"########################

"##########################
"<底部导航条和buffer显示> #
"##########################
Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"   Show all open buffers and their status
"	nmap <leader>bl :ls<CR>

"##########################
"<\底部导航条和buffer显示>#
"##########################


"########################
"       <文件查找>      #
"########################
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map='<c-f>'
let g:ctrlp_cmd='cp'
let g:ctrlp_show_hidden=1 "显示隐藏文件

"########################
"       <\文件查找>     #
"########################

"########################
"       <片段补全>      #
"########################
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"########################
"      <\片段补全>      #
"########################

"########################
"      <代码格式>      #
"########################
"########################
"      <\代码格式>      #
"########################

"########################
"      <快速注释>      #
"########################
Plugin 'scrooloose/nerdcommenter'
" nmap <leader>/  :call NERDComment("n", "Toggle")<CR>
" 映射到commet默认的快捷注释（单多行任意注释）
map <leader>/ <leader>c<Space>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a
" region
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"########################
"      <\快速注释>      #
"########################
"########################
"      <括号补全>      #
"########################
Plugin 'jiangmiao/auto-pairs'
"########################
"      <\括号补全>      #
"########################
"########################
"       <自动格式>      #
"########################
Plugin 'Chiel92/vim-autoformat'
au BufWrite * :Autoformat
let g:formatdef_harttle = '"astyle --style=attach --pad-oper"'
let g:formatters_cpp = ['harttle']
let g:formatters_java = ['harttle']
"########################
"      <\自动格式>      #
"########################

"########################
"       <两边括号>      #
"########################
Plugin 'tpope/vim-surround'
"########################
"       <\两边括号>     #
"########################

"########################
"       <快速跳转>      #
"########################
Plugin 'easymotion/vim-easymotion'
"########################
"      <\快速跳转>      #
"########################
let g:debuggerPort = 9010
let g:debuggerMaxDepth = 5
"-----------------------------------------------------------------------------------------------------
"-----------------------------------------------------------------------------------------------------
"-----------------------------------------------------------------------------------------------------

