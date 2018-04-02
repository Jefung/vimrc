
"""""""""""""""""""""""" Key Map """""""""""""""""""""""""""
nmap <Leader>en :lnext<CR>
nmap <Leader>ep :lprevious<CR>

"""""""""""""""""""""""" setting """""""""""""""""""""""""""

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1


"修改Locaton List窗口高度
let g:syntastic_loc_list_height = 5
"打开文件时自动进行检查
let g:syntastic_check_on_open = 0
"自动跳转到发现的第一个错误或警告处
let g:syntastic_auto_jump = 1

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='►'
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

let g:syntastic_cpp_checkers = ['clang_check']
" let g:syntastic_cpp_clang_check_post_args = "-I/home/jefung/repos/xml_tree/include"
" let g:syntastic_c_clang_check_args = "-I/home/jefung/repos/xml_tree/include"
" let g:syntastic_cpp_clang_check_args = "-I/home/jefung/repos/xml_tree/include"
let g:syntastic_clang_check_config_file = "~/.syntastic_clang_check_config_file"

" let g:syntastic_cpp_include_dirs = ["/home/jefung/repos/xml_tree/include/interface"]
" let g:syntastic_cpp__clang_check_args = "-p=/home/jefung/usr/llvmbuild"
" 关闭buffer时连同报错框一起关闭
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>
