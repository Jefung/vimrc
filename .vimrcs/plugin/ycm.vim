
"""""""""""""""""""""""" Key Map """""""""""""""""""""""""""
" let mapleader=";"
" nnoremap <Leader>jd :YcmCompleter GoTo<CR>
" nnoremap <Leader>jg :YcmComplete GetType<CR>



"""""""""""""""""""""""" setting """""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf ='/home/jefung/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
let g:ycm_confirm_extra_conf=0  " 打开vim时不再询问是否加载ycm_extra_conf.py配置
""让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_cache_omnifunc=0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_key_list_previous_completion = ['<C-TAB>', '<Up>']
" let g:UltiSnipsExpandTrigger = "<CR>"

" let g:ycm_key_invoke_completion = '<tab>'
" 移除ycm对c家族的代码检测，采用syntastic
let g:ycm_show_diagnostics_ui = 0
let g:ycm_use_ultisnips_completer = 1
