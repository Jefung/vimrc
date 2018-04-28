let g:vimmake_mode = { 'clangcpp':'async', 'run':'async'  }
let g:vimmake_mode["youdao"] = "async"
let g:vimmake_mode["autoformat_cpp"] = "async"
nnoremap <F5> <Esc>: copen 8 <BAR> wincmd p <BAR> VimTool run  <CR>
nnoremap <Leader>yd :let a=expand("<cword>") <Bar> copen 8 <BAR> wincmd p <BAR> exec "VimTool youdao ".a  <CR>

let g:vimmake_mode["update_cscope"] = "async"
