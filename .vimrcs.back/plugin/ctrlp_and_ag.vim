" nnoremap <Leader>ff :CtrlP
nnoremap <Leader>fb :CtrlPBuffer<CR>
nnoremap <Leader>fh :CtrlP ~<CR>
nnoremap <Leader>fa :CtrlP /<CR>
nnoremap <Leader>fr :CtrlPMRU<CR>
nnoremap <Leader>fu :CtrlPFunky<Cr>

" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" 绑定快捷, <c-p> 设置为查找家目录,速度还可以接受
let g:ctrlp_map='<C-p>'
let g:ctrlp_cmd='CtrlP ~'

" 如果没有路径启动ctrlp,会设置以下查照规则
let g:ctrlp_working_path_mode = 'ra'

" 关闭正则搜索
let g:ctrlp_regexp = 1
let g:ag_working_path_mode="r"

" 显示隐藏文件
let g:ctrlp_show_hidden = 1


" 忽略文件
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o     " MacOSX/Linux

"调用ag进行搜索提升速度，同时不使用缓存文件
" Notice: 
" 会加快速度,但是不能查找隐藏文件
" 加了查找隐藏文件功能后,发现卡顿,
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_use_caching = 1
endif
