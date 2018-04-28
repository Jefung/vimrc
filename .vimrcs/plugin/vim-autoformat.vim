
"""""""""""""""""""""""" Key Map """""""""""""""""""""""""""
" 手动格式化代码
nnoremap <leader>fm :Autoformat <BAR> w <CR>

"""""""""""""""""""""""" setting """""""""""""""""""""""""""
" 自动格式化
" au BufWrite *.cpp,*.hpp,*.h,*.c :Autoformat

" 指定格式化程序,cpp默认是clang-format
" let g:formatdef_harttle = '"astyle --style=attach --pad-oper"'
" let g:formatters_cpp = ['clang-format']
" let g:formatdef_clangformat_objc = '"clang-format -style=~/.clang-format"'
let g:formatdef_clangformat_objc = '"clang-format -style=file"'
let g:formatters_java = ['harttle']
