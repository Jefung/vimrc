nnoremap gd :call GoToDefine()<CR>
function! GoToDefine()

	let cur_line=getline(".")
	let l:target_str=matchstr(cur_line,'\w\+\s*(',match(cur_line,'\s',match(cur_line,'\w')+1))
	if l:target_str != ""
		let l:target_str=matchstr(l:target_str,'\w\+')
	endif
	" echo l:target_str
	exec ":cs find g ".l:target_str
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
		try
			exec ": cs find f ".expand('%:r').".hpp"
		catch /^Vim\%((\a\+)\)\=:E/	" catch all Vim errors
			echo "can't jump to ".expand("%:r").".hpp"
		endtry
		return
	endif
	if expand('%:e') == "hpp"
		try
			exec ":cs find f ".expand('%:r').".cpp"
			" exec ": cs find f ".expand('%:r').".hpp"
		catch /^Vim\%((\a\+)\)\=:E/	" catch all Vim errors
			echo "can't jump to ".expand("%:r").".cpp"
		endtry
		return
	endif
endfunc

fun! ShowFuncName()
	let lnum = line(".")
	let col = col(".")
	echohl ModeMsg
	echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
	echohl None
	call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
