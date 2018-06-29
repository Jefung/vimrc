" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 

" ke 生成 Makefile
" F5：单文件：运行
" F6：项目：测试
" F7：项目：编译
" F8：项目：运行
" F9：单文件：编译
" F10：打开/关闭底部的 quickfix 窗口

" 设置 F10 打开/关闭 Quickfix 窗口
"nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"map <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
map <silent> <F7> :AsyncRun -cwd=<root> make <cr>
imap <silent> <F7> <Esc>:AsyncRun -cwd=<root> make <cr>

map <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
map <silent> <F6> <Esc>:AsyncRun -cwd=<root> -raw make test <cr>

map <silent> <F5> :call AsyncRunSimpleFile()<cr>
imap <silent> <F5> <Esc>:call AsyncRunSimpleFile()<cr>

function! AsyncRunSimpleFile()
	exec "w"
	let CC="clang++"
	let CPPFLAG=" -Wall "
	let CPPFLAG .= " -Wno-unused-command-line-argument"
	let CPPFLAG=" -Wno-unused-variable"
	let CPPFLAG .= " -std=c++11"

	if search("mpi\.h") != 0 
		let CPPFLAG .="***"
	endif

	"echo "AsyncRun ".CC." ".CPPFLAG."'".VIM_FILEPATH."' -o '".VIM_FILEDIR."/".VIM_FILENOEXT
	exec "AsyncRun ".CC." ".CPPFLAG." '$(VIM_FILEPATH)'  -o '$(VIM_FILEDIR)/$(VIM_FILENOEXT)' && $(VIM_FILEDIR)/$(VIM_FILENOEXT)"
	"exec "AsyncRun -raw -cwd='$(VIM_FILEDIR)' $(VIM_FILEDIR)/$(VIM_FILENOEXT)"
endfunc

