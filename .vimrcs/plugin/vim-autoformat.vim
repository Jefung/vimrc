
"""""""""""""""""""""""" Key Map """""""""""""""""""""""""""
" 手动格式化代码
nmap <leader><leader>f :Autoformat<CR>

"""""""""""""""""""""""" setting """""""""""""""""""""""""""
" au BufWrite * :Autoformat
let g:formatdef_harttle = '"astyle --style=attach --pad-oper"'
let g:formatters_cpp = ['harttle']
let g:formatters_java = ['harttle']
