nnoremap <Leader>en :ALENext<CR>
nnoremap <Leader>ep :ALEPrevious<CR>
nnoremap <Leader>n :ALENext<CR>
nnoremap <Leader><Space> :ALEPrevious<CR>
nnoremap <Leader>j :ALENext<CR>
nnoremap <Leader>k :ALEPrevious<CR>
" Write this in your vimrc file
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1

"自定义error和warning图标
let g:ale_sign_error = 'e'
let g:ale_sign_warning = 'w'
" let g:ale_change_sign_column_color = 1
let g:ale_sign_column_always = 1
let g:ale_set_signs = 1

let g:ale_linters = {'c': 'clang'}
let g:ale_linters = { 'cpp': ['clang'] }
let g:ale_cpp_clang_options = "
			\ -std=c++11 
			\ -stdlib=libc++ 
			\ -isystem/usr/include/c++/4.8.2/
			\ -isystem/usr/include/c++/4.8.2/x86_64-redhat-linux/ "


"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'

""打开文件时不进行检查
"let g:ale_lint_on_enter = 0

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" 改变命令行消息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
