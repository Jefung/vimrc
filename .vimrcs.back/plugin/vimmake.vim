let g:vimmake_mode = { 'run':'normal'  }
let g:vimmake_mode["youdao"] = "async"
let g:vimmake_mode["autoformat_cpp"] = "async"
" let g:vimmake_mode["run"] = "bg"
" if exists("g:cur_cpp_project_dir")
nnoremap <F5> <Esc> :call Run() <CR>
inoremap <F5> <Esc> :call Run() <CR>
let g:vimmake_mode["run"] = "normal"
function! Run()
	exec "w"
	if exists("g:cur_cpp_project_dir")
		" exec "copen 8 "
		" exec "wincmd p "
		exec "VimTool run ".g:cur_cpp_project_dir
	else
		exec "echo 'do other make operator'"
	endif
endfunc

let g:vimmake_mode["debug"] = "normal"
nnoremap <F6> <Esc> :call Debug() <CR>
inoremap <F6> <Esc> :call Debug() <CR>
function! Debug()
	exec "w"
	if exists("g:cur_cpp_project_dir")
		" exec "copen 8 "
		" exec "wincmd p "
		exec "VimTool debug ".g:cur_cpp_project_dir
	else
		exec "echo do other make operator"
	endif
endfunc

nnoremap <F7> <Esc> :call Test() <CR>
inoremap <F7> <Esc> :call Test() <CR>
let g:vimmake_mode["test"] = "normal"
" let g:vimmake_mode["test"] = "async"
function! Test()
	exec "w"
	if exists("g:cur_cpp_project_dir")
		" exec "copen 8 "
		" exec "wincmd p "
		exec "VimTool test ".g:cur_cpp_project_dir
	else
		exec "echo do other make operator"
	endif
endfunc

" endifg
nnoremap <Leader>yd :let a=expand("<cword>") <Bar> copen 8 <BAR> wincmd p <BAR> exec "VimTool youdao ".a  <CR>

" let g:vimmake_mode["update_cscope"] = "async"
let g:vimmake_mode["update_cscope"] = "bg"
