set csto=0
set cst
set csverb
set cspc=3
" set nocsre
nnoremap gd :call GoToDefine()<CR>
noremap <M-d> :call GoToDefine()<CR>
imap <M-d> <ESC>:call GoToDefine() <CR>
function! GoToDefine()
	" use YcmComleter GoTo to jump to it's declaration if the command exists
	" and then use cscope cmd to it's definition

	if exists("g:ycm_auto_trigger")
		let cursor_pos=line(".")
		let cur_buf_name=bufname("%")
		let res=execute("YcmCompleter GoTo")
		" if cursor_pos!=line(".") || cur_buf_name!=bufname("%")
		"     return
		" endif
	endif
	let cur_line=getline(".")
	let l:target_str=matchstr(cur_line,'\w\+\s*(',match(cur_line,'\s',match(cur_line,'\w')+1))
	if l:target_str != ""
		let l:target_str=matchstr(l:target_str,'\w\+')
	endif
	try
		exec ":cs find g ".l:target_str
	catch /^Vim\%((\a\+)\)\=:E/	" catch all Vim errors
	endtry
endfunc


nnoremap gu :call GoToUsed() <CR>
function! GoToUsed()
	exec ":cs find c ".expand('<cword>')
endfunc

nnoremap ga :call GoToAllSymbol() <CR>
function! GoToAllSymbol()
	exec ":cs find s ".expand('<cword>')
endfunc

nnoremap gc :call GoToContain() <CR>
function! GoToContain()
	exec ":cs find d ".expand('<cword>')
endfunc

nnoremap gh :call SwitchHeaderSource() <CR>
function! SwitchHeaderSource()
	if expand('%:e') == "cpp"
		let target_filename = expand("%:r").".hpp"
	endif
	if expand('%:e') == "hpp"
		let target_filename = expand("%:r").".cpp"
	endif
	if exists("g:cur_cpp_project_dir")
		let cmd="ag -g /".target_filename." ".g:cur_cpp_project_dir
	else
		let cmd="ag -g /".target_filename
	endif
	" echo cmd
	let path=system(cmd)
	exec("e ".path)
endfunc

fun! ShowFuncName()
	let lnum = line(".")
	let col = col(".")
	echohl ModeMsg
	echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
	echohl None
	call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
