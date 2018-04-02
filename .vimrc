set nocompatible              " be iMproved, required
filetype off                  " required
" let mapleader = "/"
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
" set foldmethod=indent
set foldmethod=syntax
" au BufWinLeave * silent mkview
" au BufWinEnter * silent loadview
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
" syntax off
colorscheme monokai

" 自动回到上次的位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" autoload _vimrc
autocmd! bufwritepost $HOME/.vimrc source %

" 设置<F5>运行文件
function! Run()
    exec ":!make -C /home/jefung/repos/xml_tree"
    if &filetype == 'python'
        exec ":call RunPy()"
    endif
    if &filetype == 'cpp'
        exec ":call RunCPP()"
    endif
    if &filetype == 'sh'
        exec ":call RunSh()"
    endif
    if &filetype == 'c'
        exec ":call RunC()"
    endif
endfunc

function! RunSh()
    exec "w"
    exec "!chmod a+x %"
    exec "!./%"
endfunc
function! RunPy()
    exec "w"
    " exec "!python3 %"
    exec "!python %"
endfunc

function! RunCPP()
    exec "w"
    " exec "!clang++ -o /tmp/a.out main.cpp -lstdc++ && /tmp/a.out"
    " return
    let compilecmd="!clang++ ".expand("%")

    let compileflag="-o /tmp/a.out -lstdc++ -lgtest -lpthread"
    " let compileflag="-o /tmp/a.out -lstdc++ -lunp"
    if search("unp\.h") != 0
        let compileflag .= " -lunp -lgtest"
    endif
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
    " exec compilecmd compileflag
    exec compilecmd compileflag."&& /tmp/a.out"
endfunc

function! RunC()
    exec "w"
    let compilecmd="!clang ".expand("%")
    let compileflag="-o " .expand("%:r"). " -lstdc++"
    if search("unp\.h") != 0
        let compileflag .= " -lunp "
    endif
    exec compilecmd compileflag."&& ./". expand("%:r")
endfunc

function! Debug()
    if &filetype == 'cpp'
        exec ":call DebugCpp()"
    endif
endfunc

function! DebugCpp()
    exec "w"
    " exec "!g++ -std=c++11 -O0 -g main.cpp -o /tmp/a.out && gdb -tui /tmp/a.out"
    exec "!clang++ -lstdc++ -O0 -g main.cpp -o /tmp/a.out &&  gdb /tmp/a.out"
    " exec "!clang -lstdc++ -O0 -g main.cpp -o /tmp/a.out &&  sudo gdb  /tmp/a.out"
endfunc

map <F6> :call Debug()<CR>
imap <F5> <Esc>:call Debug() <CR>
map <F5> :call Run()<CR>
imap <F5> <Esc>:call Run() <CR>
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
    call setline(line(".")+2,"  public static void main(String args[]){")
    call setline(line(".")+3,"")
    call setline(line(".")+4,"  }")
    call setline(line(".")+5,"")
    call setline(line(".")+6,"}")
endfunc
autocmd BufNewFile *.java exec ":call PreBuildInJava()"

" 设置python的文件头
function! SetTitleForPy()
    call setline(1,"#!/usr/bin/env python")
    call setline(line(".")+1,"# -*- coding: utf-8 -*- ")
    call setline(line(".")+2,"")
endfunc
autocmd BufNewFile *.py exec ":call SetTitleForPy()"
" 设置main.cpp 的文件头
function! SetTitleForMainCpp()
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
endfunc
autocmd BufNewFile main.cpp exec ":call SetTitleForMainCpp()"

" 设置.h头文件的文件头
function! SetTitleForHeadCpp()
    call setline(1,"#ifndef ".toupper(expand("%:r")))
    call setline(line(".")+1,"#define ".toupper(expand("%:r")))
    call setline(line(".")+2,"")
    call setline(line(".")+3,"")
    call setline(line(".")+4,"#endif")
endfunc
autocmd BufNewFile *.hpp exec ":call SetTitleForHeadCpp()"

" 增加自定义修改文件名: rename newfilename
:command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname))

" 根据不同文件类型加载不同配置
au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""   Shortcut  """""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Leader + f : CtrlP
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
map <F10> :TlistToggle <CR>
nmap <Tab> : bn <CR>
nmap <Leader><Tab> : bp<CR>

"find file
" nnoremap <Leader>ff :CtrlP
nnoremap <Leader>fb :CtrlPBuffer<CR>
nnoremap <Leader>ff :CtrlPMixed<CR>
nnoremap <Leader>fr :CtrlPMRU<CR>
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" quickly comment
nmap <leader>/ <leader>c<Space>

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

" 手动格式化代码
nmap <leader><leader>f :Autoformat<CR>


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

"########################
"      <语法检测>       #
"########################
Plugin 'vim-syntastic/syntastic'
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
" Plugin 'vim-airline/vim-airline-themes'

"##########################
"<\底部导航条和buffer显示>#
"##########################


"########################
"       <文件查找>      #
"########################
Plugin 'kien/ctrlp.vim'
" let g:ctrlp_map = '<c-f>'
" let g:ctrlp_cmd='cp'
let g:ctrlpmshow_hidden=1 "显示隐藏文件
" let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_map = '<leader>tp'
" let g:ctrlp_cmd = 'CtrlP'
" map <leader>f :CtrlPMRU<CR>
" let g:ctrlp_custom_ignore = {
"     \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
"     \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
"     \ }
" let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
Plugin 'tacahiroy/ctrlp-funky'
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
" let g:UltiSnipsExpandTrigger="<tab>"
let g:ycm_key_list_select_completion=['<C-n>', '<Down>','<Tab>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>','<S-Tab>']
let g:UltiSnipsExpandTrigger="<c-o>"

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
" au BufWrite * :Autoformat
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
"########################
"       <标记插件>      #
"########################
" Plugin 'vim-scripts/ShowMarks'
" Enable ShowMarks
" let showmarks_enable = 1
" " Show which marks
" let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" " Ignore help, quickfix, non-modifiable buffers
" let showmarks_ignore_type = "hqm"
" " Hilight lower & upper marks
" let showmarks_hlline_lower = 1
" let showmarks_hlline_upper = 1
"########################
"       <\标记插件>     #
"########################
" let g:debuggerPort = 9010
" let g:debuggerMaxDepth = 5
" Plugin 'kshenoy/vim-signature'
" Plugin 'sjl/gundo.vim'

" add this line to your .vimrc file
" Plugin 'mattn/emmet-vim'

"########################
"       <py辅助插件>    #
"########################
" Plugin 'python-mode/python-mode'
"python-mode
"开启警告
" let g:pymode_warnings = 0
" "保存文件时自动删除无用空格
" let g:pymode_trim_whitespaces = 1
" let g:pymode_options = 1
" "显示允许的最大长度的列
" let g:pymode_options_colorcolumn = 1
" "设置QuickFix窗口的最大，最小高度
" let g:pymode_quickfix_minheight = 3
" let g:pymode_quickfix_maxheight = 10
" "使用python3
" " let g:pymode_python = 'python3'
" "使用PEP8风格的缩进
" let g:pymode_indent = 1
" "取消代码折叠
" let g:pymode_folding = 0
" "开启python-mode定义的移动方式
" let g:pymode_motion = 1
" "启用python-mode内置的python文档，使用K进行查找
" let g:pymode_doc = 1
" let g:pymode_doc_bind = 'K'
" "自动检测并启用virtualenv
" " let g:pymode_virtualenv = 1
" "不使用python-mode运行python代码
" let g:pymode_run = 0
" " let g:pymode_run_bind = '<Leader><Leader>r'
" "不使用python-mode设置断点
" let g:pymode_breakpoint = 0
" "let g:pymode_breakpoint_bind = '<leader>b'
" "启用python语法检查
" let g:pymode_lint = 1
" "修改后保存时进行检查
" let g:pymode_lint_on_write = 0
" "编辑时进行检查
" let g:pymode_lint_on_fly = 0
" let g:pymode_lint_checkers = ['pyflakes', 'pep8']
" "发现错误时不自动打开QuickFix窗口
" let g:pymode_lint_cwindow = 0
" "侧边栏不显示python-mode相关的标志
" let g:pymode_lint_signs = 1
" "let g:pymode_lint_todo_symbol = 'WW'
" "let g:pymode_lint_comment_symbol = 'CC'
" "let g:pymode_lint_visual_symbol = 'RR'
" "let g:pymode_lint_error_symbol = 'EE'
" "let g:pymode_lint_info_symbol = 'II'
" "let g:pymode_lint_pyflakes_symbol = 'FF'
" "启用重构
" let g:pymode_rope = 1
" "不在父目录下查找.ropeproject，能提升响应速度
" let g:pymode_rope_lookup_project = 0
" "光标下单词查阅文档
" let g:pymode_rope_show_doc_bind = '<C-c>d'
" "项目修改后重新生成缓存
" let g:pymode_rope_regenerate_on_write = 1
" "开启补全，并设置<C-Tab>为默认快捷键
" " let g:pymode_rope_completion = 1
" " let g:pymode_rope_complete_on_dot = 1
" " let g:pymode_rope_completion_bind = '<C-Tab>'
" "<C-c>g跳转到定义处，同时新建竖直窗口打开
" let g:pymode_rope_goto_definition_bind = '<C-c>g'
" let g:pymode_rope_goto_definition_cmd = 'vnew'
" "重命名光标下的函数，方法，变量及类名
" let g:pymode_rope_rename_bind = '<C-c>rr'
" "重命名光标下的模块或包
" let g:pymode_rope_rename_module_bind = '<C-c>r1r'
" "开启python所有的语法高亮
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" "高亮缩进错误
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" "高亮空格错误
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
"########################
"       </py辅助插件>    #
"########################
"-----------------------------------------------------------------------------------------------------
"-----------------------------------------------------------------------------------------------------
"-----------------------------------------------------------------------------------------------------
" set term=screen-256color

" function! FindHeaderFile()
"     " return
"     let s:curline=1
"     while s:curline<=line("$")
"         let s:line=getline(s:curline)
"         if stridx(s:line,"#include")>=0
"             let pos=[0,s:curline,0,0]
"             call setpos(".",[0,s:curline,0,0])
"             exec ":YcmCompleter GoTo"
"             " :exec "normal \<C-O>"
"             exec ":bn"
"             " let s:pos= matchend(s:line,"#include")
"
"             " let s:newstr = strpart(s:line,s:pos)
"             " let s:pos= match(s:newstr,"#")
"             " if s:pos >= 0
"             " echo s:pos
"             " echo s:newstr
"             " echo matchstr(s:newstr,"<[a-z|.|/]*>")
"         endif
"         let s:curline+=1
"     endwhile
"     " echo s:curline
"     " exec ":bn"
"     " :execute "normal \<C-O>"
" endfunc
" nnoremap <Leader>fr :call FindHeaderFile()<CR>
" set clipboard=exclude:.*
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Plugin 'nvie/vim-flake8'
" let python_highlight_all=1
" Plugin 'vim-scripts/indentpythons
set autochdir

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

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
" Plugin 'Xuyuanp/nerdtree-git-plugin'
"
Plugin 'lilydjwg/fcitx.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" let g:cpp_no_function_highlight = 1
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" let g:indent_guides_space_guides = 0
Plugin 'derekwyatt/vim-fswitch'
