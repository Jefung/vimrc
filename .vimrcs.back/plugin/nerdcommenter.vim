
"""""""""""""""""""""""" Key Map """""""""""""""""""""""""""
" nmap <leader>/  :call NERDComment("n", "Toggle")<CR>
" 映射到commet默认的快捷注释（单多行任意注释）
nmap <leader>/ <leader>c<Space>
vmap <leader>/ <leader>c<Space>

"""""""""""""""""""""""" setting """""""""""""""""""""""""""
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

