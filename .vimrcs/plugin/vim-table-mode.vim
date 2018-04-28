function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" 默认为`+`,变为`|`兼容markdown表格
let g:table_mode_corner='|'
" markdown文件自动开启
autocmd BufNew,BufEnter *.md exec "silent :TableModeEnable"

" 默认快捷键
" 删除一行: <Leader>tdd  (直接dd)
" 删除一列: <Leader>tdc 
" 对已有文本生成表格,以默认逗号作为分界: <Leader>T{pattern}  :Tableize/{pattern}
" 公式计算功能,暂时用不到
