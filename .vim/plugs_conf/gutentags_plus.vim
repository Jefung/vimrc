let g:gutentags_plus_nomap = 1
" keymap	desc
" <leader>cs	Find symbol (reference) under cursor
" <leader>cg	Find symbol definition under cursor
" <leader>cd	Functions called by this function
" <leader>cc	Functions calling this function
" <leader>ct	Find text string under cursor
" <leader>ce	Find egrep pattern under cursor
" <leader>cf	Find file name under cursor
" <leader>ci	Find files #including the file name under cursor
" <leader>ca	Find places where current symbol is assigned
" noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
" noremap <silent> <leader>gd :GscopeFind g <C-R><C-W><cr>
" noremap <silent> <leader>gu :GscopeFind c <C-R><C-W><cr>
" noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
" noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
" noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> <leader>gc :GscopeFind d <C-R><C-W><cr>
" noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>

" d: definition
nmap <silent> gd <C-]>
" c: call this functions
noremap <silent> gc :GscopeFind d <C-R><C-W><cr>
" s: symbol
noremap <silent> gs :GscopeFind s <C-R><C-W><cr>
" b : be called
noremap <silent> gb :GscopeFind c <C-R><C-W><cr> 
