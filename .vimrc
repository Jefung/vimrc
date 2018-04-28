set nocompatible              " be iMproved, required
filetype off                  " required
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
let mapleader=";"
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
"
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
"
"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回
set incsearch

" 查找忽略大小
set ignorecase

" 设置删除键
set backspace=indent,eol,start

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 基于缩进或语法进行代码折叠"
" set foldmethod=indent
set foldmethod=syntax

" 启动 vim 时关闭折叠代码
set nofoldenable

" 设置编码
set encoding=utf-8

" 使用鼠标
set mouse=a

" 设置离底部行数
set scrolloff=5

" 自动保存间隔
let autosave=2

" 换行
set wrap

" 语法高亮
syntax enable
" syntax off

" 主题颜色，加载对应的 .vim/color 目录下文件
colorscheme monokai

" 自动回到上次的位置
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 自动跳转文件所在目录
set autochdir

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""   Shortcut  """""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Leader + q : quit
"   Leader + w : save
"   Leader + o : open
"   Leader + r : refresh
"   Leader + j : ycm jump Define
"   Leader + e : syntastic
let mapleader = ";"

" help  :h key-notation
nmap <Leader>q :b# <BAR> bd# <CR>
nmap <Leader>w :w<CR>
nmap <Tab> :call ChangeBuf('n') <CR>
nmap <Leader><Tab> :call ChangeBuf('p') <CR>


" find file

" 快速注释
" quickly comment
nmap <leader>/ <leader>c<Space>

" php 注释
" phpdoc
inoremap <C-\> <ESC>:call PhpDocSingle()<CR>
nnoremap <C-\> :call PhpDocSingle()<CR>
vnoremap <C-\> :call PhpDocRange()<CR>

" 回车增加空行
" nmap  <silent> <C-m> :call append('.','') <CR>

" 取消方向键的移动
" abandon move key
map <Left>  <Nop>
map <Right> <Nop>
map <Up>    <Nop>
map <Down>  <Nop>

" 自定义大写H（行首）L（行末）
" custom upper H -> top of line, L -> end of line
" custom upper K -> top of text, J -> end of text
map H ^
map L $
" map K gg
" map J G

" 窗口移动
" move window
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-k> <C-W>k
map <C-l> <C-W>l

" 全局复制
" systematic clipboard
vmap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P o<ESC>"+p


" markdown-preview.vim 快捷
nmap <Plug>mdp <Plug>MarkdownPreview<CR>
nmap <Plug>mdps <Plug>MarkdownPreviewStop<CR>

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
"	<多光标操作>		#
"########################
Plugin 'terryma/vim-multiple-cursors'

"########################
"      <自动补全>       #
"########################
Plugin 'Valloric/YouCompleteMe'

"########################
"      <语法检测>       #
"########################
" Plugin 'vim-syntastic/syntastic'

"########################
"    <自动切换输入法>   #
"########################
Plugin 'lilydjwg/fcitx.vim'


"########################
"       <文件操作>      #
"########################
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'



"########################
"     <函数操作>       #
"########################
Plugin 'vim-scripts/taglist.vim'


"########################
"        <md>           #
"########################
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"##########################
"<底部导航条和buffer显示> #
"##########################
Plugin 'vim-airline/vim-airline'

"       <片段补全>      #
"########################
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"########################
"      <快速注释>      #
"########################
Plugin 'scrooloose/nerdcommenter'

"########################
"      <括号补全>      #
"########################
Plugin 'jiangmiao/auto-pairs'

"########################
"       <自动格式>      #
"########################
Plugin 'Chiel92/vim-autoformat'

"########################
"       <两边括号>      #
"########################
Plugin 'tpope/vim-surround'

"########################
"       <快速跳转>      #
"########################
Plugin 'easymotion/vim-easymotion'

"########################
"       <c++高亮>       #
"########################
Plugin 'octol/vim-cpp-enhanced-highlight'


"########################
"    <上下括号对齐线>   #
"########################
Plugin 'nathanaelkane/vim-indent-guides'

"########################
"     <vim表格对齐>     #
"########################
Plugin 'dhruvasagar/vim-table-mode'

"########################
"  <vim异步执行shell>   #
"########################
Plugin 'skywind3000/vimmake'

"########################
"  <异步执行shell>   #
"########################
Plugin 'kien/ctrlp.vim'
" ctrlp使用ag.vim提高查找速度,ag.vim使用外部 ag/"the_silver_searcher"
Plugin 'rking/ag.vim'

"########################
"    <异步代码检查>     #
"########################
Plugin 'w0rp/ale'


let vimrcs = $HOME."/.vimrcs"

" auto load *.vim in the dir argument you give
function! LoadVimFile(dir)
	if finddir(a:dir) != ""
		let vim_files = split(globpath(a:dir,"*.vim"),'\n')
		for f in vim_files
			exec "source " f
		endfor

		let dirs = split(globpath(a:dir,"*"),'\n')
		for subdir in dirs
			if finddir(subdir) != ""
				exec "call LoadVimFile(subdir)"
			endif
		endfor
	else
		echo a:dir." is not exists"

	endif
endfunc
exec "call LoadVimFile(vimrcs)"
set textwidth=140

" 对markdown格式的文件开启英文单词拼写检查
" open English word spell check for markdown
autocmd FileType markdown,mkd setlocal spell spelllang=cjk,en_us
" 当修改.vimrc，自动加载
autocmd! bufwritepost $HOME/.vimrc source %

" 设置变量,供下文使用
let $author_name = "Jefung"
let $author_email = "865424525jefung@gmail.com"

" question: fix nerdtree plugin bug: can't set user title when using nerdtree method to new file
" solution: add BufEnter event to file, and adjust if it's empty or not, if empty, add title to it
" 设置sh的文件头
function!  SetTitleForSh()
	let is_empty=system("test -s ". expand("%")." && echo 0 || echo 1")
	if l:is_empty == 0
		return
	endif
	if &filetype == 'sh'
		call setline(1, "\############################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Program: ")
		call append(line(".")+2, "\#	 ")
		call append(line(".")+3, "\# Usage :")
		call append(line(".")+4, "\#	 ")
		call append(line(".")+5, "\# Author :".$author_name)
		call append(line(".")+6, "\# email :".$author_email)
		call append(line(".")+7, "\# create time :".strftime("%Y-%m-%d %H:%M"))
		call append(line(".")+8, "\#======================================")
		call append(line(".")+9, "\#!/bin/bash")
		call append(line(".")+10, "")
	endif
	exec ":w"
endfunc
autocmd BufNew,BufEnter *.sh, exec ":call SetTitleForSh()"


" 设置java的文件头
function! PreBuildInJava()
	let is_empty=system("test -s ". expand("%")." && echo 0 || echo 1")
	if l:is_empty == 0
		return
	endif

	call setline(1,"public class ".expand("%:r")."{")
	call setline(line(".")+1,"")
	call setline(line(".")+2,"  public static void main(String args[]){")
	call setline(line(".")+3,"")
	call setline(line(".")+4,"  }")
	call setline(line(".")+5,"")
	call setline(line(".")+6,"}")
	exec ":w"
endfunc
autocmd BufNewFile,BufEnter *.java exec ":call PreBuildInJava()"

" 设置python的文件头
function! SetTitleForPy()
	let is_empty=system("test -s ". expand("%")." && echo 0 || echo 1")
	if l:is_empty == 0
		return
	endif
	call setline(1,"#!/usr/bin/env python")
	call setline(line(".")+1,"# -*- coding: utf-8 -*- ")
	call setline(line(".")+2,"")
	exec ":w"
endfunc
autocmd BufNewFile,BufEnter *.py exec ":call SetTitleForPy()"

" 设置main.cpp 的文件头
function! SetTitleForMainCpp()
	let is_empty=system("test -s ". expand("%")." && echo 0 || echo 1")
	if l:is_empty == 0
		return
	endif
	call setline(1,"/*")
	call setline(line(".")+1,"* auth        : Jefung")
	call setline(line(".")+2,"* version     : v1.0")
	call setline(line(".")+3,"* description : ")
	call setline(line(".")+4,"*     ")
	call setline(line(".")+5,"* analyse     : ")
	call setline(line(".")+6,"*     ")
	call setline(line(".")+7,"*/")
	call setline(line(".")+8,"")
	call setline(line(".")+9,"#include <iostream>")
	call setline(line(".")+10,"using namespace std;")
	call setline(line(".")+11,"")
	call setline(line(".")+12,"int main(int argc, char *argv[] ){")
	call setline(line(".")+13,"     ")
	call setline(line(".")+14,"}")
	exec ":w"
endfunc
autocmd BufNewFile,BufEnter main.cpp exec ":call SetTitleForMainCpp()"

" 设置.h头文件的文件头
function! SetTitleForHpp()
	let is_empty=system("test -s ". expand("%")." && echo 0 || echo 1")
	if l:is_empty == 0
		return
	endif
	call setline(1,"#ifndef ".toupper(expand("%:r")))
	call setline(line(".")+1,"#define ".toupper(expand("%:r")))
	call setline(line(".")+2,"")
	call setline(line(".")+3,"")
	call setline(line(".")+4,"#endif")
	exec ":w"
endfunc
autocmd BufNewFile,BufEnter *.hpp,*.h exec ":call SetTitleForHpp()"

" 增加自定义修改文件名: rename newfilename
:command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname))

" 自定义buffer跳转,不跳到quickfix, 不跳转到现有window所打开的buffer
" 玄学: 如果在nerdtree打开的窗口,会自动到最后的窗口切换buf
function! ChangeBuf(direction)
	" let cur_buf_num=bufnr('%')
	" let buf_num = 0
	" let all_win_buf_num = []
	" let win_num = winnr()
	" let cur_win_num = 0

	" exec "windo call add(all_win_buf_num, winbufnr(winnr()))"
	" exec "wincmd p"
	" while cur_buf_num != buf_num
	while 1
		try
			exec "b".a:direction
		catch /^Vim\%((\a\+)\)\=:E/	" catch all Vim errors
			exec "w"
			exec "b".a:direction
			echom "auto save before go to next buffer"
		endtry
		" let buf_num = bufnr('%')
		" if index(all_win_buf_num,buf_num) != -1
		"     continue
		" endif
		if( &buftype != "quickfix" )
			return
		endif
	endwhile
endfunc

" when you enter a project dir or subdir, the function
" will find the project root dir throung find some file
" that only exists in project root
function! SetCppProject()
	if has("cscope")
		"add any database in current dir
		set csto=0
		set cst
		set csverb
		set cspc=3
		if filereadable("cscope.out")
			let g:cur_cpp_project_dir=getcwd()
			silent! cs kill -1
			silent! exec "cs add cscope.out " g:cur_cpp_project_dir
		else
			let cscope_file=findfile("cscope.out", ".;")

			" can't find project root, exit
			if empty(cscope_file)
				return
			endif

			let g:cur_cpp_project_dir=matchstr(cscope_file, ".*/")
			if !empty(cscope_file) && filereadable(cscope_file)
				silent! cs kill -1
				silent! exec "cs add" cscope_file g:cur_cpp_project_dir
			endif
		endif
	endif
endfunction
auto vimenter * exec ":call SetCppProject()"
auto BufWritePost *.cpp,*.hpp,*.h,*.c, exec ":call UpdateScsopeOut()"

function! UpdateScsopeOut()
	if !exists('g:cur_cpp_project_dir') || empty(expand('%')) || match(getcwd(),g:cur_cpp_project_dir) == -1
		return
	endif
	exec "silent! VimTool update_cscope ".g:cur_cpp_project_dir
	exec "silent! cs reset"
endfunc

