set tabstop=2
set shiftwidth=2
set expandtab

set backspace=2

au BufRead,BufNewFile *.tpl set filetype=smarty

syntax on

set tags=./ctags,.ctags;
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_expandabbr_key = '<S-Tab>'
let g:use_emmet_complete_tag = 1

let g:go_fmt_autosave = 0

let g:netrw_liststyle=3

call pathogen#infect()
