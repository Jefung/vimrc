"""""""""""""""""""""""" Key Map """""""""""""""""""""""""""
map <F10> :NERDTreeToggle<CR>


"""""""""""""""""""""""" setting """""""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeWinSize=20

" Use these variables in your vimrc. Note that below are default arrow symbols
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable = '|'
let g:NERDTreeDirArrowCollapsible = '-'


" open nerdtree when use vim
" 使用vim时自动打开nerdtree
" autocmd vimenter * NERDTree

" open NERDTree automatically when vim starts up on opening a directory
" 自动打开nerdtree当你vim打开目录时候
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endi
" auto BufNewFile * exec ":NERDTreeFocus <CR> R <C-w><C-p>"
" auto BufNewFile * exec ":NERDTreeFocus <CR> R <C-w><C-p>"

" auto refresh nerdtree
" 自动刷新树
auto BufNewFile * exec "call RefreshNERDTree()"

function! RefreshNERDTree()
	if g:NERDTree.IsOpen()
		exec " NERDTreeFocus | normal R \<C-w>\<C-p>"
	else
		return
	endif
	
endfunc

" open a NERDTree automatically when vim starts up if no files were specified
" vim不指定具体文件打开时，自动使用nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 当vim中没有其他文件，值剩下nerdtree的时候，自动关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='.  a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'.  a:extension .'$#'
endfunc

" auto focus on file buffer but nerdtree buffer when enter buffer
" autocmd bufenter * if (winnr(“$”) == 2 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif
autocmd VimEnter * if (winnr("$") == 2 && exists("b:NERDTree")) | wincmd w | endif

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('cpp', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
