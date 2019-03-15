set runtimepath+=~/.vim_runtime
let mapleader = ";"
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'Yggdroot/LeaderF'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
" Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-indent'
" Plug 'kana/vim-textobj-syntax'
" Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
" Plug 'sgur/vim-textobj-parameter'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree',{ 'on':  'NERDTreeToggle'  }
" Plug 'Shougo/echodoc.vim'
" Plug 'terryma/vim-multiple-cursors'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
" Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'szw/vim-maximizer'
Plug 'skywind3000/vim-preview'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)']  }
Plug 'Jefung/h2cppx'
Plug 'lambdalisue/vim-manpager'
Plug 'solarnz/thrift.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" 从打开目录向上查找,只到找到.git文件夹,并设置.git文件夹所在目录
" 为项目的根目录g:pro.如果没有找到,则g:project_dir不存在
function! SetProjectDir()
	let project_dir=finddir(".git", ".;")
	" can't find project root, exit
	if empty(project_dir)
		return
	endif
	let g:project_dir=matchstr(project_dir, ".*/")
endfunction
auto vimenter * exec ":call SetProjectDir()"

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
exec "call LoadVimFile('~/.vim/plugs_conf')"

""""""""""""""""""""""""""" common settting """""""""""""""""""""""
colorscheme monokai
set noshowmode

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

set scrolloff=15

" 语法高亮
syntax enable
" syntax off

" 主题颜色，加载对应的 .vim/color 目录下文件
" colorscheme molokai
colorscheme monokai
" colorscheme solarized

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

" help  :h key-notation
nmap <Leader>q :b# <BAR> bd# <CR>
nmap <Leader>w :w<CR>
nmap <Tab> :call ChangeBuf('n') <CR>
nmap <Leader><Tab> :call ChangeBuf('p') <CR>


" 快速注释
" quickly comment
map <leader>/ <leader>c<Space>

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
" move indow
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-k> <C-W>k
map <C-l> <C-W>l

" 窗口缩放
nnoremap <C-W><C-L> :vertical resize +10<CR>
nnoremap <C-W><C-H> :vertical resize -10<CR>
nnoremap <C-W><C-K> :resize -10<CR>
nnoremap <C-W><C-J> :resize +10<CR>

" 窗口操作
nnoremap <C-W>q :q<CR>

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

" 自定义buffer跳转,不跳到quickfix, 不跳转到现有window所打开的buffer
" 玄学: 如果在nerdtree打开的窗口,会自动到最后的窗口切换buf
function! ChangeBuf(direction)
	if exists("b:NERDTree") || &filetype=="help" || &ft=="qf"
		echo "can't change buffer"
		return
	endif
	while 1
		try
			exec "b".a:direction
		catch /^Vim\%((\a\+)\)\=:E/	" catch all Vim errors
			exec "w"
			exec "b".a:direction
			" echom "auto save before go to next buffer"
		endtry
		if( &buftype != "quickfix" )
			return
		endif
	endwhile
endfunc

nmap <Space>j :ALENext<CR>
nmap <Space>k :ALEPrevious<CR>

function! Mv()
	    let old_name = expand('%')
	    let new_name = input('New file name: ', expand('%'), 'file')
	    if new_name != '' && new_name != old_name
   		     exec ':saveas ' . new_name
       		 exec ':silent !rm ' . old_name
	        redraw!
		endif
endfunction

function! MvCurBuf(filename)
	if a:filename != expand('%')
   		     exec ':saveas ' . new_name
       		 exec ':silent !rm ' . old_name
   			 redraw!
	endif
endfunc

command! -nargs=0 Mv call Mv()
command! -nargs=1 MvCurBuf call Mv(<args>)

function! AddCppHeaderFile()
	let final_header_line = search('#include',"be")
	if final_header_line == 0
		call append(0,"#include ")
		call cursor(1,9999)
		exe "normal! a"
	else
		call append(line('.'), "#include ")
		call cursor(line('.')+1,9999)
	endif
endfunction
nmap <leader>ah :call AddCppHeaderFile()<CR>

" 配合cppman, tmux查看c++文档
command! -nargs=+ Cppman silent! call system("tmux split-window cppman -S" . expand(<q-args>))
autocmd FileType cpp nnoremap <silent><buffer> K <Esc>:Cppman <cword><CR>
autocmd FileType c nnoremap <silent><buffer> K <Esc>:Cppman <cword><CR>

" 自动补全hpp文件头
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
	" exec ":w"
endfunc
autocmd BufNewFile,BufEnter *.hpp,*.h exec ":call SetTitleForHpp()"

" add filetype detect
autocmd BufRead,BufNewFile *.thrift set filetype=thrift
